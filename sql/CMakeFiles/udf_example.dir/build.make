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
include sql/CMakeFiles/udf_example.dir/depend.make

# Include the progress variables for this target.
include sql/CMakeFiles/udf_example.dir/progress.make

# Include the compile flags for this target's objects.
include sql/CMakeFiles/udf_example.dir/flags.make

sql/CMakeFiles/udf_example.dir/udf_example.cc.o: sql/CMakeFiles/udf_example.dir/flags.make
sql/CMakeFiles/udf_example.dir/udf_example.cc.o: sql/udf_example.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/adbms/mysqlsrc/mysql-5.6.21/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object sql/CMakeFiles/udf_example.dir/udf_example.cc.o"
	cd /home/adbms/mysqlsrc/mysql-5.6.21/sql && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/udf_example.dir/udf_example.cc.o -c /home/adbms/mysqlsrc/mysql-5.6.21/sql/udf_example.cc

sql/CMakeFiles/udf_example.dir/udf_example.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/udf_example.dir/udf_example.cc.i"
	cd /home/adbms/mysqlsrc/mysql-5.6.21/sql && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/adbms/mysqlsrc/mysql-5.6.21/sql/udf_example.cc > CMakeFiles/udf_example.dir/udf_example.cc.i

sql/CMakeFiles/udf_example.dir/udf_example.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/udf_example.dir/udf_example.cc.s"
	cd /home/adbms/mysqlsrc/mysql-5.6.21/sql && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/adbms/mysqlsrc/mysql-5.6.21/sql/udf_example.cc -o CMakeFiles/udf_example.dir/udf_example.cc.s

sql/CMakeFiles/udf_example.dir/udf_example.cc.o.requires:
.PHONY : sql/CMakeFiles/udf_example.dir/udf_example.cc.o.requires

sql/CMakeFiles/udf_example.dir/udf_example.cc.o.provides: sql/CMakeFiles/udf_example.dir/udf_example.cc.o.requires
	$(MAKE) -f sql/CMakeFiles/udf_example.dir/build.make sql/CMakeFiles/udf_example.dir/udf_example.cc.o.provides.build
.PHONY : sql/CMakeFiles/udf_example.dir/udf_example.cc.o.provides

sql/CMakeFiles/udf_example.dir/udf_example.cc.o.provides.build: sql/CMakeFiles/udf_example.dir/udf_example.cc.o

# Object files for target udf_example
udf_example_OBJECTS = \
"CMakeFiles/udf_example.dir/udf_example.cc.o"

# External object files for target udf_example
udf_example_EXTERNAL_OBJECTS =

sql/udf_example.so: sql/CMakeFiles/udf_example.dir/udf_example.cc.o
sql/udf_example.so: sql/CMakeFiles/udf_example.dir/build.make
sql/udf_example.so: sql/CMakeFiles/udf_example.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared module udf_example.so"
	cd /home/adbms/mysqlsrc/mysql-5.6.21/sql && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/udf_example.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
sql/CMakeFiles/udf_example.dir/build: sql/udf_example.so
.PHONY : sql/CMakeFiles/udf_example.dir/build

sql/CMakeFiles/udf_example.dir/requires: sql/CMakeFiles/udf_example.dir/udf_example.cc.o.requires
.PHONY : sql/CMakeFiles/udf_example.dir/requires

sql/CMakeFiles/udf_example.dir/clean:
	cd /home/adbms/mysqlsrc/mysql-5.6.21/sql && $(CMAKE_COMMAND) -P CMakeFiles/udf_example.dir/cmake_clean.cmake
.PHONY : sql/CMakeFiles/udf_example.dir/clean

sql/CMakeFiles/udf_example.dir/depend:
	cd /home/adbms/mysqlsrc/mysql-5.6.21 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/adbms/mysqlsrc/mysql-5.6.21 /home/adbms/mysqlsrc/mysql-5.6.21/sql /home/adbms/mysqlsrc/mysql-5.6.21 /home/adbms/mysqlsrc/mysql-5.6.21/sql /home/adbms/mysqlsrc/mysql-5.6.21/sql/CMakeFiles/udf_example.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : sql/CMakeFiles/udf_example.dir/depend

