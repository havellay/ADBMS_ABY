#include "lock_store.h"

/*
 * method : init_table
 * params :
 *  Allocates memory for each cell in the element of the 
 *  'table' array 
 */
int init_table()
{
  for (node_t *idx= table; idx<= &table[99]; idx++)
  {
    *idx = calloc(sizeof(node_t));
    if (idx == NULL)
      return ERROR;
  }
  return 0;
}

/*
 * method : insert_to_hash_table
 * params :
 */
int insert_to_hash_table(pid_t tid, void *addr)
{
  int idx = ((long int)addr) % 100;

  if (table[idx]->next == NULL)
  {
      table[idx]->tid=tid;  
      table[idx]->add=addr;
  }

  for (node_t *idx= table[idx]; idx->next!= NULL; idx= idx->next);

  node_t *temp= malloc(sizeof(node_t));
  if (temp== NULL)
    return ERROR;

  temp->tid   = tid;
  temp->addr  = addr;
  temp->next  = NULL;
  idx->next = temp;

  return SUCCESS;
}

/*
 * method : store_address_in
 * params :
 *    void *ptr       - stores the address where 'heap_mem' will be stored
 *    void *heap_mem  - an address to a memory location in the heap
 *    pid_t tid       - thread that will hold the lock on 'heap_mem'
 */
int store_address_in(void* ptr, void* heap_mem, pid_t tid)
{
}
