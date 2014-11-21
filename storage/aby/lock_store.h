#include <stdio.h>
#include <stdlib.h>

typedef struct node_t {
  pid_t   tid;
  void    *add;
  node_t  *next;
} node_t;

node_t *table[100];

#define ERROR   -1
#define SUCCESS 0

int init_table();
