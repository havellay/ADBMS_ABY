/* */
typedef struct node_t {
  pid_t   tid;
  void    *add;
  node_t  *next;
} node_t;

node_t *table[100];

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
      return -1;
  }
  return 0;
}

// we need a hash table that stores addresses with
// the tid of the thread that has currently locked
// the address
int insert_to_hash_table(pid_t tid, void *addr)
{
  int idx = ((long int)addr) % 100;

  if (table[idx]->next == NULL)
  {
      table[idx]->tid=tid;  
      table[idx]->add=addr;
  }
  // find the end of the linked list at table[idx] and add the new address there
  for (node_t *idx= table[idx]; idx->next!= NULL; idx= idx->next);
  node_t *temp=malloc(sizeof *temp);
  temp->tid=tid;
  temp->add=addr;
  temp->next=NULL;
  idx->next=temp;
}

int store_address_in(void* ptr, void* heap_mem, pid_t tid)
{
  // check whether the address is already present in the hash table
  // if yes, make the thread sleep for soemtime
  // how to resume the thread once the address is unlocked
 
}
