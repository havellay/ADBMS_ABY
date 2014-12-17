#include "lock_store.h"
#include <unistd.h>
#include <pthread.h>

node_t htab[HTABSIZE];

pthread_mutex_t mutex[HTABSIZE];      
pthread_cond_t  condition[HTABSIZE] ; 

#define YES 1
#define NO  0
static int init, use_mutex = NO;

static volatile int _aby_ls_lock;

/*
 * method : aby_ls_lock
 *  serializes execution using the _aby_ls_lock lock
 */
void aby_ls_lock() {
  while (__sync_lock_test_and_set(&_aby_ls_lock, 1)) {
  }
}

void aby_ls_lock_all() {
  int idx;
  for (idx=0; idx<HTABSIZE; idx++)
    aby_ls_lock();
}

/*
 * method : aby_ls_unlock
 */
void aby_ls_unlock() {
  __sync_synchronize(); // Memory barrier.
  _aby_ls_lock = 0;
}

void aby_ls_unlock_all()
{
  int idx;
  for (idx=0; idx<HTABSIZE; idx++)
    aby_ls_unlock();
}

/*
 * method : insert_into_htab
 * params :
 *    pid_t tid     - tid field of node_t
 *    void *addr    - addr field of node_t
 *    int flag      - exclusive lock or read only
 */
int insert_into_htab(pid_t tid, void *addr, int flag)
{
  int idx   = ((long int)addr) % HTABSIZE;
  node_t *hd   = NULL;
  node_t *temp = NULL;

  // if the htab[idx] is uninitialized ie., it
  // doesn't represent any address right now
  if (htab[idx].addr == 0)
  {
    htab[idx].tid   = tid;  
    htab[idx].addr  = addr;
    htab[idx].flag  = flag;
    htab[idx].count = 1;
    htab[idx].next  = NULL; // obselete statement

    return SUCCESS;
  }

  for (hd = &htab[idx]; hd->next != NULL; hd = hd->next);

  temp = malloc(sizeof(node_t));
  if (temp== NULL)
    return ERROR;

  // a lot of these will probably have to be made
  // atomic operations
  temp->tid   = tid;
  temp->addr  = addr;
  temp->flag  = flag;
  temp->count = 1;
  temp->next  = NULL;

  hd->next    = temp;

  return SUCCESS;
}

/*
 * method : htab_lookup
 * params :
 *    void *addr    - address from heap; search for this in htab
 */
node_t* htab_lookup(void*addr)
{
  int idx     = ((long int)addr) % HTABSIZE;
  node_t *hd  = NULL;

  for (hd = &htab[idx]; hd != NULL; hd = hd->next)
    if (hd->addr == addr) return hd;

  return NULL;
}

/*
 * method : store_address_in
 * params :
 *    void *ptr       - stores the address where 'heap_mem' will be stored
 *    void *heap_mem  - an address to a memory location in the heap
 *    pid_t tid       - thread that will hold the lock on 'heap_mem'
 *    int flag        - tells whether the mode is a read only or an exclusive
 *                       1 is EXCL is Exclusive
 *                       0 is RONL is Read Only
 */
int store_address_in(void* des_ptr, void* heap_mem, pid_t tid, int flag)
{
  int idx   = ((long int)heap_mem) % HTABSIZE;
  node_t *exists_at = NULL;

  // this method can change the structure of the hash table;
  // so, secure a lock before doing anything
  aby_ls_lock();

  if(!init)                                    
  {                                              
    int i;

    init=1;                                    
    for(i=0; i<HTABSIZE; i++)                    
    {                                          
      pthread_mutex_init(&mutex[i], NULL);   
      pthread_cond_init(&condition[i], NULL);
    }                                          
  }                                              

  // check whether the address is already locked;
  // for this, a lookup is done on the hashtable
  // for a node that contains the particular address
  exists_at = htab_lookup(heap_mem);

  if (exists_at == NULL)
  {
    // the address doesn't exist in the heap and so,
    // it can be acquired by thread 'tid' ......(1)
    if (insert_into_htab(tid, heap_mem, flag) == SUCCESS)
    {
      *(int**)des_ptr = (int*)heap_mem;        // check whether this line is correct
      aby_ls_unlock();
      return SUCCESS;
    }
    else
    {
      aby_ls_unlock();
      return ERROR;
    }
  }
  else
  {
    if (exists_at->tid == tid)
    {
      if (exists_at->flag == flag)
      {
        // this thread holds the lock and in the same
        // mode that it is requesting now
        *(int**)des_ptr = (int*)heap_mem;        // check whether this line is correct
        aby_ls_unlock();
        return SUCCESS;
      }
      else if (exists_at->flag == RONL && flag == EXCL)
      {
        // the address is currently secured with
        // a read only lock; it has to be promoted
        // to an exclusive lock
        if (exists_at->count > 1)
        {
          // this tread needs to sleep and check whether
          // it can promote preiodically.
          while (exists_at->tid != tid
              && exists_at->tid != 0
              && exists_at->addr == heap_mem)
          {
            char buff[512];

            thread_says_bye(1);
            sprintf(buff,
                "tid %d, heapmem %ld, is going to sleep, exists_at-tid %d",
                tid, ((long int)heap_mem) % HTABSIZE, exists_at->tid);
            log_this(buff, 1100);

            aby_ls_unlock();

            if (use_mutex == YES)
            {
              pthread_mutex_lock(&mutex[idx]);
              pthread_cond_wait(&condition[idx], &mutex[idx]);
              pthread_mutex_unlock(&mutex[idx]);
            }
            else
            {
              usleep(10);
            }

            aby_ls_lock();
          }
          if (insert_into_htab(tid, heap_mem, flag) == SUCCESS)
          {
            *(int**)des_ptr = (int*)heap_mem;        // check whether this line is correct
            aby_ls_unlock();
            return SUCCESS;
          }
          else
          {
            aby_ls_unlock();
            return ERROR;
          }
        }
        else if (exists_at->count == 1)
        {
          // simple promotion, just change the mode of
          // the lock
          exists_at->flag = flag;

          *(int**)des_ptr = (int*)heap_mem;        // check whether this line is correct
          aby_ls_unlock();
          return SUCCESS;
        }
        else
        {
          // something has messed with the node - investigate
        }
      }
      else if (exists_at->flag == EXCL && flag == RONL)
      {
        // just let it be an exclusive lock for now
        *(int**)des_ptr = (int*)heap_mem;        // check whether this line is correct
        aby_ls_unlock();
        return SUCCESS;
      }
    }
    else
    {
      if (exists_at->flag == RONL && flag == RONL)
      {
        // some other thread was the first to acquire the lock, but
        // this thread can share it
        exists_at->count++;
        if (exists_at->tid == 1)
          exists_at->tid = tid;

        *(int**)des_ptr = (int*)heap_mem;        // check whether this line is correct
        aby_ls_unlock();
        return SUCCESS;
      }
      else 
      {
        while (exists_at->tid != tid
            && exists_at->tid != 0
            && exists_at->addr == heap_mem)
        {
          char buff[512];

          thread_says_bye(1);
          sprintf(buff,
              "tid %d, heapmem %ld, is going to sleep, exists_at-tid %d",
              tid, ((long int)heap_mem) % HTABSIZE, exists_at->tid);
          log_this(buff, 1100);

          aby_ls_unlock();
          if (use_mutex == YES)
          {
            pthread_mutex_lock(&mutex[idx]);
            pthread_cond_wait(&condition[idx], &mutex[idx]);
            pthread_mutex_unlock(&mutex[idx]);
          }
          else
          {
            usleep(20);
          }
          aby_ls_lock();
        }
        if (insert_into_htab(tid, heap_mem, flag) == SUCCESS)
        {
          *(int**)des_ptr = (int*)heap_mem;        // check whether this line is correct
          aby_ls_unlock();
          return SUCCESS;
        }
        else
        {
          aby_ls_unlock();
          return ERROR;
        }
      }
    }
  }
  aby_ls_unlock();
  return ERROR;
}

/*
 * method : remove_from_htab
 * params :
 *    void *heap_mem  - an address to a memory location in the heap
 *    pid_t tid       - thread that will hold the lock on 'heap_mem'
 */
// HARI : not using this method right now, when this is used,
// find out what it should do with the flag
int remove_from_htab(void* heap_mem, pid_t tid)
{
  int idx = 0;
  node_t *hd = NULL;
  node_t *hd_prev = NULL;

  return ERROR; // when you figure out what to do with this method,
                // remove this statement.

  aby_ls_lock();

  idx = ((long int)heap_mem) % HTABSIZE;
  hd      = htab_lookup(heap_mem);
  hd_prev = NULL;

  if(hd!=NULL && hd->tid==tid)
    hd->tid=0;
  else
  {
    if (use_mutex == YES)
    {
      pthread_cond_signal( &condition[idx] );
    }
    aby_ls_unlock();
    return ERROR;
  }

  for (*hd_prev = htab[idx]; hd_prev != NULL; hd_prev = hd_prev->next)
    if(hd_prev->next == hd)
    {
      hd_prev->next=hd->next;
      free(hd);
      if (use_mutex == YES)
      {
        pthread_cond_signal( &condition[idx] );
      }
      aby_ls_unlock();
      return SUCCESS;
    }
  aby_ls_unlock();
  return ERROR;
}

/*
 * method : thread_says_bye
 * params :
 *  pid_t tid   - id of thread that is saying bye
 */
int thread_says_bye (pid_t tid)
{
  // traverse through the hashtable and remove any nodes
  // that contain this thread's tid.
  node_t *htab_ptr = NULL;
  node_t *hd_prev = NULL, *hd = NULL;
  static int rubbish_count = 0;

  aby_ls_lock();

  rubbish_count++;

  for (htab_ptr = htab; htab_ptr < htab+HTABSIZE; htab_ptr++)
  {
    long int addr = (long int) htab_ptr->addr;
    hd_prev = NULL;
    for (hd = htab_ptr; hd != NULL; hd_prev = hd, hd = hd->next)
    {
      if (hd->tid == tid)
      {
        // hd is now a node that has to be removed
        if (hd->flag == RONL)
        {
          if (hd->count >= 2)
          {
            hd->tid = 1;
            if (hd->tid != 1)
              hd->count--;
          }
          else
          {
            if (hd_prev == NULL)
            {
              // this is the first node in this
              // bucket and has to be removed
              hd->tid  = 0;
              hd->addr = 0;
              hd->next = NULL;
              hd->count = 0;
            }
            else
            {
              hd_prev->next = hd->next;
              free(hd);
            }
          }
        }
        else if (hd->flag == EXCL)
        {
          if (hd_prev == NULL)
          {
            // this is the first node in this
            // bucket and has to be removed
            hd->tid  = 0;
            hd->addr = 0;
            hd->next = NULL;
            hd->count = 0;
          }
          else
          {
            hd_prev->next = hd->next;
            free(hd);
          }
        }
        if (use_mutex == YES)
        {
          char buff[512];
          sprintf(buff, "waking up %ld", (addr%HTABSIZE));
          log_this(buff, 1100);

          pthread_cond_signal(&condition[addr % HTABSIZE]);
        }
      }
    }
  }
  /* aby_ls_unlock_all(); */
  aby_ls_unlock();

  if (rubbish_count >= 20)
  {
    rubbish_count = 0;
    thread_says_bye(1);
    // once in a while, clean all nodes
    // that have a thread id 1 and count 0
    // for this, we should be just able to
    // use this same method's definition
  }

  return SUCCESS;
}
