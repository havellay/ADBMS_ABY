mv build.make build.make1
sed -e s/heap/aby/g -e s/HEAP/ABY/g build.make1 > build.make
rm build.make1

mv C.includecache C.includecache1
sed -e s/heap/aby/g -e s/HEAP/ABY/g C.includecache1 > C.includecache
rm C.includecache1

mv cmake_clean.cmake cmake_clean.cmake1
sed -e s/heap/aby/g -e s/HEAP/ABY/g cmake_clean.cmake1 > cmake_clean.cmake
rm cmake_clean.cmake1

# mv cmake_clean_target.cmake cmake_clean_target.cmake1
# sed -e s/heap/aby/g -e s/HEAP/ABY/g cmake_clean_target.cmake1 > cmake_clean_target.cmake
# rm cmake_clean_target.cmake1
# 
# mv CXX.includecache CXX.includecache1
# sed -e s/heap/aby/g -e s/HEAP/ABY/g CXX.includecache1 > CXX.includecache
# rm CXX.includecache1

mv DependInfo.cmake DependInfo.cmake1
sed -e s/heap/aby/g -e s/HEAP/ABY/g DependInfo.cmake1 > DependInfo.cmake
rm DependInfo.cmake1

mv depend.internal depend.internal1
sed -e s/heap/aby/g -e s/HEAP/ABY/g depend.internal1 > depend.internal
rm depend.internal1

mv depend.make depend.make1
sed -e s/heap/aby/g -e s/HEAP/ABY/g depend.make1 > depend.make
rm depend.make1

mv flags.make flags.make1
sed -e s/heap/aby/g -e s/HEAP/ABY/g flags.make1 > flags.make
rm flags.make1

mv link.txt link.txt1
sed -e s/heap/aby/g -e s/HEAP/ABY/g link.txt1 > link.txt
rm link.txt1

mv progress.make progress.make1
sed -e s/heap/aby/g -e s/HEAP/ABY/g progress.make1 > progress.make
rm progress.make1
