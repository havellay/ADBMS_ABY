#include "lock_store.h"

// TO DO:
// * instead of an array of hashtables, this
//   can be made an array of red-black tree
//   nodes for quicker retrieval
// * 

node_t *htab[HTABSIZE];

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
int init_htab()
{
  for (node_t *idx = htab; idx <= &htab[HTABSIZE-1]; idx++)
  {
    *idx = calloc(sizeof(node_t));
    if (idx == NULL)
      return ERROR;
  }
  return 0;
}

/*
 * method : insert_into_htab
 * params :
 *    pid_t tid     - tid field of node_t
 *    void *addr    - addr field of node_t
 */
int insert_into_htab(pid_t tid, void *addr)
{
  int idx = ((long int)addr) % HTABSIZE;

  if (htab[idx]->next == NULL)
  {
      htab[idx]->tid  = tid;  
      htab[idx]->addr = addr;
  }

  for (node_t *hd = &htab[idx]; hd->next != NULL; hd = hd->next);

  node_t *temp= malloc(sizeof(node_t));
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
  int idx = ((long int)addr) % HTABSIZE;

  for (node_t *hd = &htab[idx]; hd != NULL; hd = hd->next)
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
  // this method can change the structure of the hash table;
  // so, secure a lock before doing anything
  aby_ls_lock();

  // check whether the address is already locked;
  // for this, a lookup is done on the hashtable
  // for a node that contains the particular address
  node_t *exists_at = htab_lookup(heap_mem);
  if (exists_at == NULL)
  {
    // the address doesn't exist in the heap and so,
    // it can be acquired by thread 'tid' ......(1)
    if (insert_into_htab(tid, heap_mem) == SUCCESS)
    {
      *des_ptr = heap_mem;        // check whether this line is correct
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
        *des_ptr = heap_mem;    // check whether this line is correct
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

int remove_from_htab(void* heap_mem, pid_t tid)
{
   int idx = ((long int)heap_mem) % HTABSIZE;
   node_t * hd=htab_lookup(heap_mem);
   if(hd!=NULL && hd->tid==tid)
   {
       hd->tid=0;
   }
   else
    return ERROR;
   for (node_t *hdprev = &htab[idx]; hdprev != NULL; hdprev = hdprev->next)
   if(hdprev->next == hd)
   {
       hdprev->next=hd->next;
       free(hd);
       return SUCCESS;
   }
   return ERROR;
}





