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
include unittest/examples/CMakeFiles/no_plan-t.dir/depend.make

# Include the progress variables for this target.
include unittest/examples/CMakeFiles/no_plan-t.dir/progress.make

# Include the compile flags for this target's objects.
include unittest/examples/CMakeFiles/no_plan-t.dir/flags.make

unittest/examples/CMakeFiles/no_plan-t.dir/no_plan-t.c.o: unittest/examples/CMakeFiles/no_plan-t.dir/flags.make
unittest/examples/CMakeFiles/no_plan-t.dir/no_plan-t.c.o: unittest/examples/no_plan-t.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/adbms/mysqlsrc/mysql-5.6.21/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object unittest/examples/CMakeFiles/no_plan-t.dir/no_plan-t.c.o"
	cd /home/adbms/mysqlsrc/mysql-5.6.21/unittest/examples && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/no_plan-t.dir/no_plan-t.c.o   -c /home/adbms/mysqlsrc/mysql-5.6.21/unittest/examples/no_plan-t.c

unittest/examples/CMakeFiles/no_plan-t.dir/no_plan-t.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/no_plan-t.dir/no_plan-t.c.i"
	cd /home/adbms/mysqlsrc/mysql-5.6.21/unittest/examples && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/adbms/mysqlsrc/mysql-5.6.21/unittest/examples/no_plan-t.c > CMakeFiles/no_plan-t.dir/no_plan-t.c.i

unittest/examples/CMakeFiles/no_plan-t.dir/no_plan-t.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/no_plan-t.dir/no_plan-t.c.s"
	cd /home/adbms/mysqlsrc/mysql-5.6.21/unittest/examples && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/adbms/mysqlsrc/mysql-5.6.21/unittest/examples/no_plan-t.c -o CMakeFiles/no_plan-t.dir/no_plan-t.c.s

unittest/examples/CMakeFiles/no_plan-t.dir/no_plan-t.c.o.requires:
.PHONY : unittest/examples/CMakeFiles/no_plan-t.dir/no_plan-t.c.o.requires

unittest/examples/CMakeFiles/no_plan-t.dir/no_plan-t.c.o.provides: unittest/examples/CMakeFiles/no_plan-t.dir/no_plan-t.c.o.requires
	$(MAKE) -f unittest/examples/CMakeFiles/no_plan-t.dir/build.make unittest/examples/CMakeFiles/no_plan-t.dir/no_plan-t.c.o.provides.build
.PHONY : unittest/examples/CMakeFiles/no_plan-t.dir/no_plan-t.c.o.provides

unittest/examples/CMakeFiles/no_plan-t.dir/no_plan-t.c.o.provides.build: unittest/examples/CMakeFiles/no_plan-t.dir/no_plan-t.c.o

# Object files for target no_plan-t
no_plan__t_OBJECTS = \
"CMakeFiles/no_plan-t.dir/no_plan-t.c.o"

# External object files for target no_plan-t
no_plan__t_EXTERNAL_OBJECTS =

unittest/examples/no_plan-t: unittest/examples/CMakeFiles/no_plan-t.dir/no_plan-t.c.o
unittest/examples/no_plan-t: unittest/examples/CMakeFiles/no_plan-t.dir/build.make
unittest/examples/no_plan-t: unittest/mytap/libmytap.a
unittest/examples/no_plan-t: mysys/libmysys.a
unittest/examples/no_plan-t: dbug/libdbug.a
unittest/examples/no_plan-t: mysys/libmysys.a
unittest/examples/no_plan-t: dbug/libdbug.a
unittest/examples/no_plan-t: strings/libstrings.a
unittest/examples/no_plan-t: zlib/libzlib.a
unittest/examples/no_plan-t: unittest/examples/CMakeFiles/no_plan-t.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable no_plan-t"
	cd /home/adbms/mysqlsrc/mysql-5.6.21/unittest/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/no_plan-t.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
unittest/examples/CMakeFiles/no_plan-t.dir/build: unittest/examples/no_plan-t
.PHONY : unittest/examples/CMakeFiles/no_plan-t.dir/build

unittest/examples/CMakeFiles/no_plan-t.dir/requires: unittest/examples/CMakeFiles/no_plan-t.dir/no_plan-t.c.o.requires
.PHONY : unittest/examples/CMakeFiles/no_plan-t.dir/requires

unittest/examples/CMakeFiles/no_plan-t.dir/clean:
	cd /home/adbms/mysqlsrc/mysql-5.6.21/unittest/examples && $(CMAKE_COMMAND) -P CMakeFiles/no_plan-t.dir/cmake_clean.cmake
.PHONY : unittest/examples/CMakeFiles/no_plan-t.dir/clean

unittest/examples/CMakeFiles/no_plan-t.dir/depend:
	cd /home/adbms/mysqlsrc/mysql-5.6.21 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/adbms/mysqlsrc/mysql-5.6.21 /home/adbms/mysqlsrc/mysql-5.6.21/unittest/examples /home/adbms/mysqlsrc/mysql-5.6.21 /home/adbms/mysqlsrc/mysql-5.6.21/unittest/examples /home/adbms/mysqlsrc/mysql-5.6.21/unittest/examples/CMakeFiles/no_plan-t.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : unittest/examples/CMakeFiles/no_plan-t.dir/depend

