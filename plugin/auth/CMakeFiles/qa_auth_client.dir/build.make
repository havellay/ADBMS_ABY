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
CMAKE_SOURCE_DIR = /home/hari/ADBMS_PROJECT/ADBMS_ABY

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/hari/ADBMS_PROJECT/ADBMS_ABY

# Include any dependencies generated for this target.
include plugin/auth/CMakeFiles/qa_auth_client.dir/depend.make

# Include the progress variables for this target.
include plugin/auth/CMakeFiles/qa_auth_client.dir/progress.make

# Include the compile flags for this target's objects.
include plugin/auth/CMakeFiles/qa_auth_client.dir/flags.make

plugin/auth/CMakeFiles/qa_auth_client.dir/qa_auth_client.c.o: plugin/auth/CMakeFiles/qa_auth_client.dir/flags.make
plugin/auth/CMakeFiles/qa_auth_client.dir/qa_auth_client.c.o: plugin/auth/qa_auth_client.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/hari/ADBMS_PROJECT/ADBMS_ABY/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object plugin/auth/CMakeFiles/qa_auth_client.dir/qa_auth_client.c.o"
	cd /home/hari/ADBMS_PROJECT/ADBMS_ABY/plugin/auth && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/qa_auth_client.dir/qa_auth_client.c.o   -c /home/hari/ADBMS_PROJECT/ADBMS_ABY/plugin/auth/qa_auth_client.c

plugin/auth/CMakeFiles/qa_auth_client.dir/qa_auth_client.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/qa_auth_client.dir/qa_auth_client.c.i"
	cd /home/hari/ADBMS_PROJECT/ADBMS_ABY/plugin/auth && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/hari/ADBMS_PROJECT/ADBMS_ABY/plugin/auth/qa_auth_client.c > CMakeFiles/qa_auth_client.dir/qa_auth_client.c.i

plugin/auth/CMakeFiles/qa_auth_client.dir/qa_auth_client.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/qa_auth_client.dir/qa_auth_client.c.s"
	cd /home/hari/ADBMS_PROJECT/ADBMS_ABY/plugin/auth && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/hari/ADBMS_PROJECT/ADBMS_ABY/plugin/auth/qa_auth_client.c -o CMakeFiles/qa_auth_client.dir/qa_auth_client.c.s

plugin/auth/CMakeFiles/qa_auth_client.dir/qa_auth_client.c.o.requires:
.PHONY : plugin/auth/CMakeFiles/qa_auth_client.dir/qa_auth_client.c.o.requires

plugin/auth/CMakeFiles/qa_auth_client.dir/qa_auth_client.c.o.provides: plugin/auth/CMakeFiles/qa_auth_client.dir/qa_auth_client.c.o.requires
	$(MAKE) -f plugin/auth/CMakeFiles/qa_auth_client.dir/build.make plugin/auth/CMakeFiles/qa_auth_client.dir/qa_auth_client.c.o.provides.build
.PHONY : plugin/auth/CMakeFiles/qa_auth_client.dir/qa_auth_client.c.o.provides

plugin/auth/CMakeFiles/qa_auth_client.dir/qa_auth_client.c.o.provides.build: plugin/auth/CMakeFiles/qa_auth_client.dir/qa_auth_client.c.o

# Object files for target qa_auth_client
qa_auth_client_OBJECTS = \
"CMakeFiles/qa_auth_client.dir/qa_auth_client.c.o"

# External object files for target qa_auth_client
qa_auth_client_EXTERNAL_OBJECTS =

plugin/auth/qa_auth_client.so: plugin/auth/CMakeFiles/qa_auth_client.dir/qa_auth_client.c.o
plugin/auth/qa_auth_client.so: plugin/auth/CMakeFiles/qa_auth_client.dir/build.make
plugin/auth/qa_auth_client.so: libservices/libmysqlservices.a
plugin/auth/qa_auth_client.so: plugin/auth/CMakeFiles/qa_auth_client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C shared module qa_auth_client.so"
	cd /home/hari/ADBMS_PROJECT/ADBMS_ABY/plugin/auth && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/qa_auth_client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
plugin/auth/CMakeFiles/qa_auth_client.dir/build: plugin/auth/qa_auth_client.so
.PHONY : plugin/auth/CMakeFiles/qa_auth_client.dir/build

# Object files for target qa_auth_client
qa_auth_client_OBJECTS = \
"CMakeFiles/qa_auth_client.dir/qa_auth_client.c.o"

# External object files for target qa_auth_client
qa_auth_client_EXTERNAL_OBJECTS =

plugin/auth/CMakeFiles/CMakeRelink.dir/qa_auth_client.so: plugin/auth/CMakeFiles/qa_auth_client.dir/qa_auth_client.c.o
plugin/auth/CMakeFiles/CMakeRelink.dir/qa_auth_client.so: plugin/auth/CMakeFiles/qa_auth_client.dir/build.make
plugin/auth/CMakeFiles/CMakeRelink.dir/qa_auth_client.so: libservices/libmysqlservices.a
plugin/auth/CMakeFiles/CMakeRelink.dir/qa_auth_client.so: plugin/auth/CMakeFiles/qa_auth_client.dir/relink.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C shared module CMakeFiles/CMakeRelink.dir/qa_auth_client.so"
	cd /home/hari/ADBMS_PROJECT/ADBMS_ABY/plugin/auth && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/qa_auth_client.dir/relink.txt --verbose=$(VERBOSE)

# Rule to relink during preinstall.
plugin/auth/CMakeFiles/qa_auth_client.dir/preinstall: plugin/auth/CMakeFiles/CMakeRelink.dir/qa_auth_client.so
.PHONY : plugin/auth/CMakeFiles/qa_auth_client.dir/preinstall

plugin/auth/CMakeFiles/qa_auth_client.dir/requires: plugin/auth/CMakeFiles/qa_auth_client.dir/qa_auth_client.c.o.requires
.PHONY : plugin/auth/CMakeFiles/qa_auth_client.dir/requires

plugin/auth/CMakeFiles/qa_auth_client.dir/clean:
	cd /home/hari/ADBMS_PROJECT/ADBMS_ABY/plugin/auth && $(CMAKE_COMMAND) -P CMakeFiles/qa_auth_client.dir/cmake_clean.cmake
.PHONY : plugin/auth/CMakeFiles/qa_auth_client.dir/clean

plugin/auth/CMakeFiles/qa_auth_client.dir/depend:
	cd /home/hari/ADBMS_PROJECT/ADBMS_ABY && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hari/ADBMS_PROJECT/ADBMS_ABY /home/hari/ADBMS_PROJECT/ADBMS_ABY/plugin/auth /home/hari/ADBMS_PROJECT/ADBMS_ABY /home/hari/ADBMS_PROJECT/ADBMS_ABY/plugin/auth /home/hari/ADBMS_PROJECT/ADBMS_ABY/plugin/auth/CMakeFiles/qa_auth_client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : plugin/auth/CMakeFiles/qa_auth_client.dir/depend

