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
include storage/aby/CMakeFiles/hpa_aby_test1.dir/depend.make

# Include the progress variables for this target.
include storage/aby/CMakeFiles/hpa_aby_test1.dir/progress.make

# Include the compile flags for this target's objects.
include storage/aby/CMakeFiles/hpa_aby_test1.dir/flags.make

storage/aby/CMakeFiles/hpa_aby_test1.dir/hpa_aby_test1.c.o: storage/aby/CMakeFiles/hpa_aby_test1.dir/flags.make
storage/aby/CMakeFiles/hpa_aby_test1.dir/hpa_aby_test1.c.o: storage/aby/hpa_aby_test1.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/adbms/mysqlsrc/mysql-5.6.21/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object storage/aby/CMakeFiles/hpa_aby_test1.dir/hpa_aby_test1.c.o"
	cd /home/adbms/mysqlsrc/mysql-5.6.21/storage/aby && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/hpa_aby_test1.dir/hpa_aby_test1.c.o   -c /home/adbms/mysqlsrc/mysql-5.6.21/storage/aby/hpa_aby_test1.c

storage/aby/CMakeFiles/hpa_aby_test1.dir/hpa_aby_test1.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hpa_aby_test1.dir/hpa_aby_test1.c.i"
	cd /home/adbms/mysqlsrc/mysql-5.6.21/storage/aby && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/adbms/mysqlsrc/mysql-5.6.21/storage/aby/hpa_aby_test1.c > CMakeFiles/hpa_aby_test1.dir/hpa_aby_test1.c.i

storage/aby/CMakeFiles/hpa_aby_test1.dir/hpa_aby_test1.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hpa_aby_test1.dir/hpa_aby_test1.c.s"
	cd /home/adbms/mysqlsrc/mysql-5.6.21/storage/aby && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/adbms/mysqlsrc/mysql-5.6.21/storage/aby/hpa_aby_test1.c -o CMakeFiles/hpa_aby_test1.dir/hpa_aby_test1.c.s

storage/aby/CMakeFiles/hpa_aby_test1.dir/hpa_aby_test1.c.o.requires:
.PHONY : storage/aby/CMakeFiles/hpa_aby_test1.dir/hpa_aby_test1.c.o.requires

storage/aby/CMakeFiles/hpa_aby_test1.dir/hpa_aby_test1.c.o.provides: storage/aby/CMakeFiles/hpa_aby_test1.dir/hpa_aby_test1.c.o.requires
	$(MAKE) -f storage/aby/CMakeFiles/hpa_aby_test1.dir/build.make storage/aby/CMakeFiles/hpa_aby_test1.dir/hpa_aby_test1.c.o.provides.build
.PHONY : storage/aby/CMakeFiles/hpa_aby_test1.dir/hpa_aby_test1.c.o.provides

storage/aby/CMakeFiles/hpa_aby_test1.dir/hpa_aby_test1.c.o.provides.build: storage/aby/CMakeFiles/hpa_aby_test1.dir/hpa_aby_test1.c.o

# Object files for target hpa_aby_test1
hpa_aby_test1_OBJECTS = \
"CMakeFiles/hpa_aby_test1.dir/hpa_aby_test1.c.o"

# External object files for target hpa_aby_test1
hpa_aby_test1_EXTERNAL_OBJECTS =

storage/aby/hpa_aby_test1: storage/aby/CMakeFiles/hpa_aby_test1.dir/hpa_aby_test1.c.o
storage/aby/hpa_aby_test1: storage/aby/CMakeFiles/hpa_aby_test1.dir/build.make
storage/aby/hpa_aby_test1: storage/aby/libaby.a
storage/aby/hpa_aby_test1: mysys/libmysys.a
storage/aby/hpa_aby_test1: dbug/libdbug.a
storage/aby/hpa_aby_test1: mysys/libmysys.a
storage/aby/hpa_aby_test1: dbug/libdbug.a
storage/aby/hpa_aby_test1: strings/libstrings.a
storage/aby/hpa_aby_test1: zlib/libzlib.a
storage/aby/hpa_aby_test1: storage/aby/CMakeFiles/hpa_aby_test1.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable hpa_aby_test1"
	cd /home/adbms/mysqlsrc/mysql-5.6.21/storage/aby && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hpa_aby_test1.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
storage/aby/CMakeFiles/hpa_aby_test1.dir/build: storage/aby/hpa_aby_test1
.PHONY : storage/aby/CMakeFiles/hpa_aby_test1.dir/build

storage/aby/CMakeFiles/hpa_aby_test1.dir/requires: storage/aby/CMakeFiles/hpa_aby_test1.dir/hpa_aby_test1.c.o.requires
.PHONY : storage/aby/CMakeFiles/hpa_aby_test1.dir/requires

storage/aby/CMakeFiles/hpa_aby_test1.dir/clean:
	cd /home/adbms/mysqlsrc/mysql-5.6.21/storage/aby && $(CMAKE_COMMAND) -P CMakeFiles/hpa_aby_test1.dir/cmake_clean.cmake
.PHONY : storage/aby/CMakeFiles/hpa_aby_test1.dir/clean

storage/aby/CMakeFiles/hpa_aby_test1.dir/depend:
	cd /home/adbms/mysqlsrc/mysql-5.6.21 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/adbms/mysqlsrc/mysql-5.6.21 /home/adbms/mysqlsrc/mysql-5.6.21/storage/aby /home/adbms/mysqlsrc/mysql-5.6.21 /home/adbms/mysqlsrc/mysql-5.6.21/storage/aby /home/adbms/mysqlsrc/mysql-5.6.21/storage/aby/CMakeFiles/hpa_aby_test1.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : storage/aby/CMakeFiles/hpa_aby_test1.dir/depend

