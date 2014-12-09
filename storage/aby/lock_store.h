#include <stdio.h>
#include <stdlib.h>

#define EXCL  1
#define RONL  0

typedef struct node_t {
  pid_t   tid;
  void    *addr;
  int     flag;
  int     count;

  struct node_t  *next;
} node_t;


#define ERROR     -1
#define SUCCESS    0

#define HTABSIZE   100

int store_address_in(void*, void*, pid_t, int flag);
int thread_says_bye(pid_t);

extern int log_this(const char*, int);
