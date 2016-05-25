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
include predictor/CMakeFiles/llsp.dir/depend.make

# Include the progress variables for this target.
include predictor/CMakeFiles/llsp.dir/progress.make

# Include the compile flags for this target's objects.
include predictor/CMakeFiles/llsp.dir/flags.make

predictor/CMakeFiles/llsp.dir/llsp.c.o: predictor/CMakeFiles/llsp.dir/flags.make
predictor/CMakeFiles/llsp.dir/llsp.c.o: predictor/llsp.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lukas/Development/hannes/atlas-rt/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object predictor/CMakeFiles/llsp.dir/llsp.c.o"
	cd /home/lukas/Development/hannes/atlas-rt/predictor && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/llsp.dir/llsp.c.o   -c /home/lukas/Development/hannes/atlas-rt/predictor/llsp.c

predictor/CMakeFiles/llsp.dir/llsp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/llsp.dir/llsp.c.i"
	cd /home/lukas/Development/hannes/atlas-rt/predictor && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lukas/Development/hannes/atlas-rt/predictor/llsp.c > CMakeFiles/llsp.dir/llsp.c.i

predictor/CMakeFiles/llsp.dir/llsp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/llsp.dir/llsp.c.s"
	cd /home/lukas/Development/hannes/atlas-rt/predictor && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lukas/Development/hannes/atlas-rt/predictor/llsp.c -o CMakeFiles/llsp.dir/llsp.c.s

predictor/CMakeFiles/llsp.dir/llsp.c.o.requires:

.PHONY : predictor/CMakeFiles/llsp.dir/llsp.c.o.requires

predictor/CMakeFiles/llsp.dir/llsp.c.o.provides: predictor/CMakeFiles/llsp.dir/llsp.c.o.requires
	$(MAKE) -f predictor/CMakeFiles/llsp.dir/build.make predictor/CMakeFiles/llsp.dir/llsp.c.o.provides.build
.PHONY : predictor/CMakeFiles/llsp.dir/llsp.c.o.provides

predictor/CMakeFiles/llsp.dir/llsp.c.o.provides.build: predictor/CMakeFiles/llsp.dir/llsp.c.o


# Object files for target llsp
llsp_OBJECTS = \
"CMakeFiles/llsp.dir/llsp.c.o"

# External object files for target llsp
llsp_EXTERNAL_OBJECTS =

predictor/libllsp.a: predictor/CMakeFiles/llsp.dir/llsp.c.o
predictor/libllsp.a: predictor/CMakeFiles/llsp.dir/build.make
predictor/libllsp.a: predictor/CMakeFiles/llsp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lukas/Development/hannes/atlas-rt/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library libllsp.a"
	cd /home/lukas/Development/hannes/atlas-rt/predictor && $(CMAKE_COMMAND) -P CMakeFiles/llsp.dir/cmake_clean_target.cmake
	cd /home/lukas/Development/hannes/atlas-rt/predictor && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/llsp.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
predictor/CMakeFiles/llsp.dir/build: predictor/libllsp.a

.PHONY : predictor/CMakeFiles/llsp.dir/build

predictor/CMakeFiles/llsp.dir/requires: predictor/CMakeFiles/llsp.dir/llsp.c.o.requires

.PHONY : predictor/CMakeFiles/llsp.dir/requires

predictor/CMakeFiles/llsp.dir/clean:
	cd /home/lukas/Development/hannes/atlas-rt/predictor && $(CMAKE_COMMAND) -P CMakeFiles/llsp.dir/cmake_clean.cmake
.PHONY : predictor/CMakeFiles/llsp.dir/clean

predictor/CMakeFiles/llsp.dir/depend:
	cd /home/lukas/Development/hannes/atlas-rt && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lukas/Development/hannes/atlas-rt /home/lukas/Development/hannes/atlas-rt/predictor /home/lukas/Development/hannes/atlas-rt /home/lukas/Development/hannes/atlas-rt/predictor /home/lukas/Development/hannes/atlas-rt/predictor/CMakeFiles/llsp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : predictor/CMakeFiles/llsp.dir/depend

