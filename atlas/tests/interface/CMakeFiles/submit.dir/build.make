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
include atlas/tests/interface/CMakeFiles/submit.dir/depend.make

# Include the progress variables for this target.
include atlas/tests/interface/CMakeFiles/submit.dir/progress.make

# Include the compile flags for this target's objects.
include atlas/tests/interface/CMakeFiles/submit.dir/flags.make

atlas/tests/interface/CMakeFiles/submit.dir/submit.c++.o: atlas/tests/interface/CMakeFiles/submit.dir/flags.make
atlas/tests/interface/CMakeFiles/submit.dir/submit.c++.o: atlas/tests/interface/submit.c++
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lukas/Development/hannes/atlas-rt/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object atlas/tests/interface/CMakeFiles/submit.dir/submit.c++.o"
	cd /home/lukas/Development/hannes/atlas-rt/atlas/tests/interface && /usr/bin/clang++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/submit.dir/submit.c++.o -c /home/lukas/Development/hannes/atlas-rt/atlas/tests/interface/submit.c++

atlas/tests/interface/CMakeFiles/submit.dir/submit.c++.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/submit.dir/submit.c++.i"
	cd /home/lukas/Development/hannes/atlas-rt/atlas/tests/interface && /usr/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lukas/Development/hannes/atlas-rt/atlas/tests/interface/submit.c++ > CMakeFiles/submit.dir/submit.c++.i

atlas/tests/interface/CMakeFiles/submit.dir/submit.c++.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/submit.dir/submit.c++.s"
	cd /home/lukas/Development/hannes/atlas-rt/atlas/tests/interface && /usr/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lukas/Development/hannes/atlas-rt/atlas/tests/interface/submit.c++ -o CMakeFiles/submit.dir/submit.c++.s

atlas/tests/interface/CMakeFiles/submit.dir/submit.c++.o.requires:

.PHONY : atlas/tests/interface/CMakeFiles/submit.dir/submit.c++.o.requires

atlas/tests/interface/CMakeFiles/submit.dir/submit.c++.o.provides: atlas/tests/interface/CMakeFiles/submit.dir/submit.c++.o.requires
	$(MAKE) -f atlas/tests/interface/CMakeFiles/submit.dir/build.make atlas/tests/interface/CMakeFiles/submit.dir/submit.c++.o.provides.build
.PHONY : atlas/tests/interface/CMakeFiles/submit.dir/submit.c++.o.provides

atlas/tests/interface/CMakeFiles/submit.dir/submit.c++.o.provides.build: atlas/tests/interface/CMakeFiles/submit.dir/submit.c++.o


# Object files for target submit
submit_OBJECTS = \
"CMakeFiles/submit.dir/submit.c++.o"

# External object files for target submit
submit_EXTERNAL_OBJECTS =

atlas/tests/interface/submit: atlas/tests/interface/CMakeFiles/submit.dir/submit.c++.o
atlas/tests/interface/submit: atlas/tests/interface/CMakeFiles/submit.dir/build.make
atlas/tests/interface/submit: common/libcommon.a
atlas/tests/interface/submit: atlas/tests/interface/CMakeFiles/submit.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lukas/Development/hannes/atlas-rt/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable submit"
	cd /home/lukas/Development/hannes/atlas-rt/atlas/tests/interface && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/submit.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
atlas/tests/interface/CMakeFiles/submit.dir/build: atlas/tests/interface/submit

.PHONY : atlas/tests/interface/CMakeFiles/submit.dir/build

atlas/tests/interface/CMakeFiles/submit.dir/requires: atlas/tests/interface/CMakeFiles/submit.dir/submit.c++.o.requires

.PHONY : atlas/tests/interface/CMakeFiles/submit.dir/requires

atlas/tests/interface/CMakeFiles/submit.dir/clean:
	cd /home/lukas/Development/hannes/atlas-rt/atlas/tests/interface && $(CMAKE_COMMAND) -P CMakeFiles/submit.dir/cmake_clean.cmake
.PHONY : atlas/tests/interface/CMakeFiles/submit.dir/clean

atlas/tests/interface/CMakeFiles/submit.dir/depend:
	cd /home/lukas/Development/hannes/atlas-rt && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lukas/Development/hannes/atlas-rt /home/lukas/Development/hannes/atlas-rt/atlas/tests/interface /home/lukas/Development/hannes/atlas-rt /home/lukas/Development/hannes/atlas-rt/atlas/tests/interface /home/lukas/Development/hannes/atlas-rt/atlas/tests/interface/CMakeFiles/submit.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : atlas/tests/interface/CMakeFiles/submit.dir/depend
