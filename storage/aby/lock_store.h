#include <stdio.h>
#include <stdlib.h>

typedef struct node_t {
  pid_t   tid;
  void    *addr;
  struct node_t  *next;
} node_t;


#define ERROR   -1
#define SUCCESS 0

#define HTABSIZE   100

int init_table();
int insert_into_htab(pid_t, void*);
int store_address_in(void*, void*, pid_t);
