# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_SOURCE_DIR = /home/lukas/Development/hannes/atlas-rt

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lukas/Development/hannes/atlas-rt

# Include any dependencies generated for this target.
include runtime/tests/CMakeFiles/concurrent-queue-tests.dir/depend.make

# Include the progress variables for this target.
include runtime/tests/CMakeFiles/concurrent-queue-tests.dir/progress.make

# Include the compile flags for this target's objects.
include runtime/tests/CMakeFiles/concurrent-queue-tests.dir/flags.make

runtime/tests/CMakeFiles/concurrent-queue-tests.dir/concurrent-queue-tests.c++.o: runtime/tests/CMakeFiles/concurrent-queue-tests.dir/flags.make
runtime/tests/CMakeFiles/concurrent-queue-tests.dir/concurrent-queue-tests.c++.o: runtime/tests/concurrent-queue-tests.c++
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lukas/Development/hannes/atlas-rt/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object runtime/tests/CMakeFiles/concurrent-queue-tests.dir/concurrent-queue-tests.c++.o"
	cd /home/lukas/Development/hannes/atlas-rt/runtime/tests && /usr/bin/clang++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/concurrent-queue-tests.dir/concurrent-queue-tests.c++.o -c /home/lukas/Development/hannes/atlas-rt/runtime/tests/concurrent-queue-tests.c++

runtime/tests/CMakeFiles/concurrent-queue-tests.dir/concurrent-queue-tests.c++.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/concurrent-queue-tests.dir/concurrent-queue-tests.c++.i"
	cd /home/lukas/Development/hannes/atlas-rt/runtime/tests && /usr/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lukas/Development/hannes/atlas-rt/runtime/tests/concurrent-queue-tests.c++ > CMakeFiles/concurrent-queue-tests.dir/concurrent-queue-tests.c++.i

runtime/tests/CMakeFiles/concurrent-queue-tests.dir/concurrent-queue-tests.c++.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/concurrent-queue-tests.dir/concurrent-queue-tests.c++.s"
	cd /home/lukas/Development/hannes/atlas-rt/runtime/tests && /usr/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lukas/Development/hannes/atlas-rt/runtime/tests/concurrent-queue-tests.c++ -o CMakeFiles/concurrent-queue-tests.dir/concurrent-queue-tests.c++.s

runtime/tests/CMakeFiles/concurrent-queue-tests.dir/concurrent-queue-tests.c++.o.requires:

.PHONY : runtime/tests/CMakeFiles/concurrent-queue-tests.dir/concurrent-queue-tests.c++.o.requires

runtime/tests/CMakeFiles/concurrent-queue-tests.dir/concurrent-queue-tests.c++.o.provides: runtime/tests/CMakeFiles/concurrent-queue-tests.dir/concurrent-queue-tests.c++.o.requires
	$(MAKE) -f runtime/tests/CMakeFiles/concurrent-queue-tests.dir/build.make runtime/tests/CMakeFiles/concurrent-queue-tests.dir/concurrent-queue-tests.c++.o.provides.build
.PHONY : runtime/tests/CMakeFiles/concurrent-queue-tests.dir/concurrent-queue-tests.c++.o.provides

runtime/tests/CMakeFiles/concurrent-queue-tests.dir/concurrent-queue-tests.c++.o.provides.build: runtime/tests/CMakeFiles/concurrent-queue-tests.dir/concurrent-queue-tests.c++.o


# Object files for target concurrent-queue-tests
concurrent__queue__tests_OBJECTS = \
"CMakeFiles/concurrent-queue-tests.dir/concurrent-queue-tests.c++.o"

# External object files for target concurrent-queue-tests
concurrent__queue__tests_EXTERNAL_OBJECTS =

runtime/tests/concurrent-queue-tests: runtime/tests/CMakeFiles/concurrent-queue-tests.dir/concurrent-queue-tests.c++.o
runtime/tests/concurrent-queue-tests: runtime/tests/CMakeFiles/concurrent-queue-tests.dir/build.make
runtime/tests/concurrent-queue-tests: Dependencies/Build/GTestExternal/libgtest.a
runtime/tests/concurrent-queue-tests: runtime/libatlas-runtime.so
runtime/tests/concurrent-queue-tests: runtime/tests/CMakeFiles/concurrent-queue-tests.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lukas/Development/hannes/atlas-rt/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable concurrent-queue-tests"
	cd /home/lukas/Development/hannes/atlas-rt/runtime/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/concurrent-queue-tests.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
runtime/tests/CMakeFiles/concurrent-queue-tests.dir/build: runtime/tests/concurrent-queue-tests

.PHONY : runtime/tests/CMakeFiles/concurrent-queue-tests.dir/build

runtime/tests/CMakeFiles/concurrent-queue-tests.dir/requires: runtime/tests/CMakeFiles/concurrent-queue-tests.dir/concurrent-queue-tests.c++.o.requires

.PHONY : runtime/tests/CMakeFiles/concurrent-queue-tests.dir/requires

runtime/tests/CMakeFiles/concurrent-queue-tests.dir/clean:
	cd /home/lukas/Development/hannes/atlas-rt/runtime/tests && $(CMAKE_COMMAND) -P CMakeFiles/concurrent-queue-tests.dir/cmake_clean.cmake
.PHONY : runtime/tests/CMakeFiles/concurrent-queue-tests.dir/clean

runtime/tests/CMakeFiles/concurrent-queue-tests.dir/depend:
	cd /home/lukas/Development/hannes/atlas-rt && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lukas/Development/hannes/atlas-rt /home/lukas/Development/hannes/atlas-rt/runtime/tests /home/lukas/Development/hannes/atlas-rt /home/lukas/Development/hannes/atlas-rt/runtime/tests /home/lukas/Development/hannes/atlas-rt/runtime/tests/CMakeFiles/concurrent-queue-tests.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : runtime/tests/CMakeFiles/concurrent-queue-tests.dir/depend
