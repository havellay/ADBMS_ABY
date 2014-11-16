#include<stdio.h>
#include<pthread.h>

/* very simple atomic operations implemented
 * using  */

#define NUMBER_OF_THREADS 500

volatile int exclusion = 0;

void lock() {
  while (__sync_lock_test_and_set(&exclusion, 1)) {
    // Do nothing. This GCC builtin instruction
    // ensures memory barrier.
    printf("waste cycles\n");
    // the wasted cycles here is sort of tolerable
    // about 100 or so for 500 threads
  }
}

void unlock() {
  __sync_synchronize(); // Memory barrier.
  exclusion = 0;
}

int big_func(int val)
{
  lock();
  int sum = 0;
  int i;
  static int count = 0;
  printf("number of threads here is %d\n", ++count);
  for(i=0; i<val; i++)
    sum+=val;
  count--;
  unlock();
  return sum;
}

void *func(void* arg_ptr)
{
  int num = 0;
  __sync_fetch_and_add(&num, big_func(10));
}

int main()
{
  pthread_t id[NUMBER_OF_THREADS];
  int i;

  for(i=0; i<NUMBER_OF_THREADS; i++)
    pthread_create(&id[i], NULL, func, NULL);
  for(i=0; i<NUMBER_OF_THREADS; i++)
    pthread_join(id[i], NULL);
}
