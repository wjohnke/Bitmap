# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.12

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
CMAKE_COMMAND = /usr/bin/cmake3

# The command to remove a file.
RM = /usr/bin/cmake3 -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/wmjxb2/CS4520/bitmap

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/wmjxb2/CS4520/bitmap/build

# Include any dependencies generated for this target.
include CMakeFiles/libblock_store.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/libblock_store.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/libblock_store.dir/flags.make

CMakeFiles/libblock_store.dir/src/block_store.c.o: CMakeFiles/libblock_store.dir/flags.make
CMakeFiles/libblock_store.dir/src/block_store.c.o: ../src/block_store.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wmjxb2/CS4520/bitmap/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/libblock_store.dir/src/block_store.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/libblock_store.dir/src/block_store.c.o   -c /home/wmjxb2/CS4520/bitmap/src/block_store.c

CMakeFiles/libblock_store.dir/src/block_store.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libblock_store.dir/src/block_store.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/wmjxb2/CS4520/bitmap/src/block_store.c > CMakeFiles/libblock_store.dir/src/block_store.c.i

CMakeFiles/libblock_store.dir/src/block_store.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libblock_store.dir/src/block_store.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/wmjxb2/CS4520/bitmap/src/block_store.c -o CMakeFiles/libblock_store.dir/src/block_store.c.s

# Object files for target libblock_store
libblock_store_OBJECTS = \
"CMakeFiles/libblock_store.dir/src/block_store.c.o"

# External object files for target libblock_store
libblock_store_EXTERNAL_OBJECTS =

liblibblock_store.so: CMakeFiles/libblock_store.dir/src/block_store.c.o
liblibblock_store.so: CMakeFiles/libblock_store.dir/build.make
liblibblock_store.so: libbitmap.a
liblibblock_store.so: CMakeFiles/libblock_store.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wmjxb2/CS4520/bitmap/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library liblibblock_store.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/libblock_store.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/libblock_store.dir/build: liblibblock_store.so

.PHONY : CMakeFiles/libblock_store.dir/build

CMakeFiles/libblock_store.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/libblock_store.dir/cmake_clean.cmake
.PHONY : CMakeFiles/libblock_store.dir/clean

CMakeFiles/libblock_store.dir/depend:
	cd /home/wmjxb2/CS4520/bitmap/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wmjxb2/CS4520/bitmap /home/wmjxb2/CS4520/bitmap /home/wmjxb2/CS4520/bitmap/build /home/wmjxb2/CS4520/bitmap/build /home/wmjxb2/CS4520/bitmap/build/CMakeFiles/libblock_store.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/libblock_store.dir/depend
