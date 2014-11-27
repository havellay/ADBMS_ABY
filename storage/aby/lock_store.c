#include "lock_store.h"
#include <unistd.h>

// TO DO:
// * instead of an array of hashtables, this
//   can be made an array of red-black tree
//   nodes for quicker retrieval
// * 

node_t htab[HTABSIZE];

static volatile int _aby_ls_lock = 0;

/*
 * method : aby_ls_lock
 *  serializes execution using the _aby_ls_lock lock
 */
void aby_ls_lock() {
  while (__sync_lock_test_and_set(&_aby_ls_lock, 1)) {
  }
}

/*
 * method : aby_ls_unlock
 */
void aby_ls_unlock() {
  __sync_synchronize(); // Memory barrier.
  _aby_ls_lock = 0;
}

/*
 * method : init_htab
 * params :
 *  Allocates memory for each cell in the element of the 
 *  'htab' array 
 */
/*
 * int init_htab()
 * {
 *   for (node_t *idx = htab[0]; idx <= &htab[HTABSIZE-1]; idx++)
 *   {
 *     *idx = calloc(sizeof(node_t));
 *     if (idx == NULL)
 *       return ERROR;
 *   }
 *   return 0;
 * }
 */

/*
 * method : insert_into_htab
 * params :
 *    pid_t tid     - tid field of node_t
 *    void *addr    - addr field of node_t
 */
int insert_into_htab(pid_t tid, void *addr)
{
  int idx   = ((long int)addr) % HTABSIZE;
  node_t *hd  = NULL;
  node_t *temp = NULL;

  if (htab[idx].next == NULL)
  {
    htab[idx].tid  = tid;  
    htab[idx].addr = addr;
  }

  for (hd = &htab[idx]; hd->next != NULL; hd = hd->next);

  temp= malloc(sizeof(node_t));
  if (temp== NULL)
    return ERROR;

  // a lot of these will probably have to be made
  // atomic operations
  temp->tid   = tid;
  temp->addr  = addr;
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
 */
int store_address_in(void* des_ptr, void* heap_mem, pid_t tid)
{
  node_t *exists_at = NULL;
  // this method can change the structure of the hash table;
  // so, secure a lock before doing anything
  aby_ls_lock();

  // check whether the address is already locked;
  // for this, a lookup is done on the hashtable
  // for a node that contains the particular address
  exists_at = htab_lookup(heap_mem);
  if (exists_at == NULL)
  {
    // the address doesn't exist in the heap and so,
    // it can be acquired by thread 'tid' ......(1)
    if (insert_into_htab(tid, heap_mem) == SUCCESS)
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
    // tid has to sleep for sometime
    if (exists_at->tid == tid)
    {
      // the thread already owns this memory; just let it continue
      // perform the storage here similar to ......(1)
      aby_ls_unlock();
      return SUCCESS;
    }
    else
    {
      // the following section has to be protected by a lock
      while (exists_at->tid != 0 && exists_at->addr == heap_mem)
      {
        aby_ls_unlock();
        usleep(10);
        aby_ls_lock();
      }
      if (insert_into_htab(tid, heap_mem) == SUCCESS)
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

/*
 * method : remove_from_htab
 * params :
 *    void *heap_mem  - an address to a memory location in the heap
 *    pid_t tid       - thread that will hold the lock on 'heap_mem'
 */
int remove_from_htab(void* heap_mem, pid_t tid)
{
  int idx = 0;
  node_t *hd = NULL;
  node_t *hd_prev = NULL;

  aby_ls_lock();

  idx = ((long int)heap_mem) % HTABSIZE;
  hd      = htab_lookup(heap_mem);
  hd_prev = NULL;

  if(hd!=NULL && hd->tid==tid)
    hd->tid=0;
  else
  {
    aby_ls_unlock();
    return ERROR;
  }

  for (*hd_prev = htab[idx]; hd_prev != NULL; hd_prev = hd_prev->next)
    if(hd_prev->next == hd)
    {
      hd_prev->next=hd->next;
      free(hd);
      aby_ls_unlock();
      return SUCCESS;
    }
  aby_ls_unlock();
  return ERROR;
}


