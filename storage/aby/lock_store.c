/* */
typedef struct node_t {
  pid_t   tid;
  void    *add;
  node_t  *next;
} node_t;

node_t *table[100];

int init_table()
{
  // bunch of malloc calls to initialize the first
  // element in each linked list in table
}

// we need a hash table that stores addresses with
// the tid of the thread that has currently locked
// the address
int insert_to_hash_table(pid_t tid, void *addr)
{
  int idx = ((long int)addr) % 100;

  if (table[idx]->next == NULL)
    

  // find the end of the linked list at table[idx] and add the new address there
  for (node_t *idx= table[idx]; idx->next!= NULL; idx= idx->next);

}

int store_address_in(void* ptr, void* heap_mem, pid_t tid)
{
  // check whether the address is already present in the hash table
  // if yes, make the thread sleep for soemtime
  // how to resume the thread once the address is unlocked
}
