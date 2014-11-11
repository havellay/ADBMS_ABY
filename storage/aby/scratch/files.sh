#!/bin/sh

# these are going to be done
sed -e s/heap/aby/g -e s/HEAP/ABY/g ha_heap.cc > ha_aby.cc
sed -e s/heap/aby/g -e s/HEAP/ABY/g ha_heap.h > ha_aby.h
sed -e s/heap/aby/g -e s/HEAP/ABY/g _aby_check.c > _aby_check1.c
sed -e s/heap/aby/g -e s/HEAP/ABY/g heapdef.h > heapdef1.h
sed -e s/heap/aby/g -e s/HEAP/ABY/g hpa_block.c > hpa_block1.c
sed -e s/heap/aby/g -e s/HEAP/ABY/g hpa_clear.c > hpa_clear1.c
sed -e s/heap/aby/g -e s/HEAP/ABY/g hpa_close.c > hpa_close1.c
sed -e s/heap/aby/g -e s/HEAP/ABY/g hpa_create.c > hpa_create1.c
sed -e s/heap/aby/g -e s/HEAP/ABY/g hpa_delete.c > hpa_delete1.c
sed -e s/heap/aby/g -e s/HEAP/ABY/g hpa_extra.c > hpa_extra.1c
sed -e s/heap/aby/g -e s/HEAP/ABY/g hpa_hash.c > hpa_hash1.c
sed -e s/heap/aby/g -e s/HEAP/ABY/g hpa_info.c > hpa_info1.c
sed -e s/heap/aby/g -e s/HEAP/ABY/g hpa_open.c > hpa_open1.c
sed -e s/heap/aby/g -e s/HEAP/ABY/g hpa_panic.c > hpa_panic1.c
sed -e s/heap/aby/g -e s/HEAP/ABY/g hpa_rename.c > hpa_rename1.c
sed -e s/heap/aby/g -e s/HEAP/ABY/g hpa_rfirst.c > hpa_rfirst1.c
sed -e s/heap/aby/g -e s/HEAP/ABY/g hpa_rkey.c > hpa_rkey1.c
sed -e s/heap/aby/g -e s/HEAP/ABY/g hpa_rlast.c > hpa_rlast1.c
sed -e s/heap/aby/g -e s/HEAP/ABY/g hpa_rnext.c > hpa_rnext1.c
sed -e s/heap/aby/g -e s/HEAP/ABY/g hpa_rprev.c > hpa_rprev1.c
sed -e s/heap/aby/g -e s/HEAP/ABY/g hpa_rrnd.c > hpa_rrnd1.c
sed -e s/heap/aby/g -e s/HEAP/ABY/g hpa_rsame.c > hpa_rsame1.c
sed -e s/heap/aby/g -e s/HEAP/ABY/g hpa_scan.c > hpa_scan1.c
sed -e s/heap/aby/g -e s/HEAP/ABY/g hpa_static.c > hpa_static1.c
sed -e s/heap/aby/g -e s/HEAP/ABY/g hpa_test1.c > hpa_test11.c
sed -e s/heap/aby/g -e s/HEAP/ABY/g hpa_test2.c > hpa_test21.c
sed -e s/heap/aby/g -e s/HEAP/ABY/g hpa_update.c > hpa_update1.c
sed -e s/heap/aby/g -e s/HEAP/ABY/g hpa_write.c > hpa_write1.c
sed -e s/heap/aby/g -e s/HEAP/ABY/g Makefile > Makefile1
sed -e s/heap/aby/g -e s/HEAP/ABY/g _aby_rectest.c > _aby_rectest1.c

# not done
# sed -e s/heap/aby/g -e s/HEAP/ABY/g CMakeFiles
# sed -e s/heap/aby/g -e s/HEAP/ABY/g cmake_install.cmake
# sed -e s/heap/aby/g -e s/HEAP/ABY/g CMakeLists.txt
# sed -e s/heap/aby/g -e s/HEAP/ABY/g CTestTestfile.cmake
