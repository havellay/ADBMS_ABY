# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/adbms/mysqlsrc/mysql-5.6.21

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/adbms/mysqlsrc/mysql-5.6.21

# Include any dependencies generated for this target.
include libmysqld/CMakeFiles/mysqlserver.dir/depend.make

# Include the progress variables for this target.
include libmysqld/CMakeFiles/mysqlserver.dir/progress.make

# Include the compile flags for this target's objects.
include libmysqld/CMakeFiles/mysqlserver.dir/flags.make

libmysqld/mysqlserver_depends.c: dbug/libdbug.a
libmysqld/mysqlserver_depends.c: strings/libstrings.a
libmysqld/mysqlserver_depends.c: regex/libregex.a
libmysqld/mysqlserver_depends.c: mysys/libmysys.a
libmysqld/mysqlserver_depends.c: mysys_ssl/libmysys_ssl.a
libmysqld/mysqlserver_depends.c: vio/libvio.a
libmysqld/mysqlserver_depends.c: zlib/libzlib.a
libmysqld/mysqlserver_depends.c: extra/yassl/libyassl.a
libmysqld/mysqlserver_depends.c: extra/yassl/taocrypt/libtaocrypt.a
libmysqld/mysqlserver_depends.c: storage/archive/libarchive.a
libmysqld/mysqlserver_depends.c: zlib/libzlib.a
libmysqld/mysqlserver_depends.c: storage/blackhole/libblackhole.a
libmysqld/mysqlserver_depends.c: storage/csv/libcsv.a
libmysqld/mysqlserver_depends.c: storage/myisammrg/libmyisammrg_embedded.a
libmysqld/mysqlserver_depends.c: storage/perfschema/libperfschema.a
libmysqld/mysqlserver_depends.c: storage/innobase/libinnobase.a
libmysqld/mysqlserver_depends.c: zlib/libzlib.a
libmysqld/mysqlserver_depends.c: storage/aby/libaby_embedded.a
libmysqld/mysqlserver_depends.c: storage/federated/libfederated.a
libmysqld/mysqlserver_depends.c: storage/myisam/libmyisam_embedded.a
libmysqld/mysqlserver_depends.c: storage/heap/libheap_embedded.a
libmysqld/mysqlserver_depends.c: sql/libpartition_embedded.a
libmysqld/mysqlserver_depends.c: libmysqld/libsql_embedded.a
	$(CMAKE_COMMAND) -E cmake_progress_report /home/adbms/mysqlsrc/mysql-5.6.21/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating mysqlserver_depends.c"
	cd /home/adbms/mysqlsrc/mysql-5.6.21/libmysqld && /usr/bin/cmake -E touch /home/adbms/mysqlsrc/mysql-5.6.21/libmysqld/mysqlserver_depends.c

libmysqld/CMakeFiles/mysqlserver.dir/mysqlserver_depends.c.o: libmysqld/CMakeFiles/mysqlserver.dir/flags.make
libmysqld/CMakeFiles/mysqlserver.dir/mysqlserver_depends.c.o: libmysqld/mysqlserver_depends.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/adbms/mysqlsrc/mysql-5.6.21/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object libmysqld/CMakeFiles/mysqlserver.dir/mysqlserver_depends.c.o"
	cd /home/adbms/mysqlsrc/mysql-5.6.21/libmysqld && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/mysqlserver.dir/mysqlserver_depends.c.o   -c /home/adbms/mysqlsrc/mysql-5.6.21/libmysqld/mysqlserver_depends.c

libmysqld/CMakeFiles/mysqlserver.dir/mysqlserver_depends.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mysqlserver.dir/mysqlserver_depends.c.i"
	cd /home/adbms/mysqlsrc/mysql-5.6.21/libmysqld && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/adbms/mysqlsrc/mysql-5.6.21/libmysqld/mysqlserver_depends.c > CMakeFiles/mysqlserver.dir/mysqlserver_depends.c.i

libmysqld/CMakeFiles/mysqlserver.dir/mysqlserver_depends.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mysqlserver.dir/mysqlserver_depends.c.s"
	cd /home/adbms/mysqlsrc/mysql-5.6.21/libmysqld && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/adbms/mysqlsrc/mysql-5.6.21/libmysqld/mysqlserver_depends.c -o CMakeFiles/mysqlserver.dir/mysqlserver_depends.c.s

libmysqld/CMakeFiles/mysqlserver.dir/mysqlserver_depends.c.o.requires:
.PHONY : libmysqld/CMakeFiles/mysqlserver.dir/mysqlserver_depends.c.o.requires

libmysqld/CMakeFiles/mysqlserver.dir/mysqlserver_depends.c.o.provides: libmysqld/CMakeFiles/mysqlserver.dir/mysqlserver_depends.c.o.requires
	$(MAKE) -f libmysqld/CMakeFiles/mysqlserver.dir/build.make libmysqld/CMakeFiles/mysqlserver.dir/mysqlserver_depends.c.o.provides.build
.PHONY : libmysqld/CMakeFiles/mysqlserver.dir/mysqlserver_depends.c.o.provides

libmysqld/CMakeFiles/mysqlserver.dir/mysqlserver_depends.c.o.provides.build: libmysqld/CMakeFiles/mysqlserver.dir/mysqlserver_depends.c.o

# Object files for target mysqlserver
mysqlserver_OBJECTS = \
"CMakeFiles/mysqlserver.dir/mysqlserver_depends.c.o"

# External object files for target mysqlserver
mysqlserver_EXTERNAL_OBJECTS =

libmysqld/libmysqld.a: libmysqld/CMakeFiles/mysqlserver.dir/mysqlserver_depends.c.o
libmysqld/libmysqld.a: libmysqld/CMakeFiles/mysqlserver.dir/build.make
libmysqld/libmysqld.a: libmysqld/CMakeFiles/mysqlserver.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C static library libmysqld.a"
	cd /home/adbms/mysqlsrc/mysql-5.6.21/libmysqld && $(CMAKE_COMMAND) -P CMakeFiles/mysqlserver.dir/cmake_clean_target.cmake
	cd /home/adbms/mysqlsrc/mysql-5.6.21/libmysqld && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mysqlserver.dir/link.txt --verbose=$(VERBOSE)
	cd /home/adbms/mysqlsrc/mysql-5.6.21/libmysqld && rm /home/adbms/mysqlsrc/mysql-5.6.21/libmysqld/libmysqld.a
	cd /home/adbms/mysqlsrc/mysql-5.6.21/libmysqld && /usr/bin/cmake -P /home/adbms/mysqlsrc/mysql-5.6.21/libmysqld/merge_archives_mysqlserver.cmake

# Rule to build all files generated by this target.
libmysqld/CMakeFiles/mysqlserver.dir/build: libmysqld/libmysqld.a
.PHONY : libmysqld/CMakeFiles/mysqlserver.dir/build

libmysqld/CMakeFiles/mysqlserver.dir/requires: libmysqld/CMakeFiles/mysqlserver.dir/mysqlserver_depends.c.o.requires
.PHONY : libmysqld/CMakeFiles/mysqlserver.dir/requires

libmysqld/CMakeFiles/mysqlserver.dir/clean:
	cd /home/adbms/mysqlsrc/mysql-5.6.21/libmysqld && $(CMAKE_COMMAND) -P CMakeFiles/mysqlserver.dir/cmake_clean.cmake
.PHONY : libmysqld/CMakeFiles/mysqlserver.dir/clean

libmysqld/CMakeFiles/mysqlserver.dir/depend: libmysqld/mysqlserver_depends.c
	cd /home/adbms/mysqlsrc/mysql-5.6.21 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/adbms/mysqlsrc/mysql-5.6.21 /home/adbms/mysqlsrc/mysql-5.6.21/libmysqld /home/adbms/mysqlsrc/mysql-5.6.21 /home/adbms/mysqlsrc/mysql-5.6.21/libmysqld /home/adbms/mysqlsrc/mysql-5.6.21/libmysqld/CMakeFiles/mysqlserver.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libmysqld/CMakeFiles/mysqlserver.dir/depend

