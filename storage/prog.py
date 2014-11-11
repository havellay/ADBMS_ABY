heap = open('heap/nm_heap', 'r')
aby  = open('aby/nm_aby', 'r')
op = open('headache', 'w')

heap_lst = []
aby_lst = []

for line in heap:
    heap_lst.append(line.rstrip())

for line in aby:
    aby_lst.append(line.rstrip())

for x in set(aby_lst):
    if x in heap_lst:
        op.write(x+'\n')

op.close()
