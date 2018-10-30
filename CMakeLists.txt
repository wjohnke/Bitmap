cmake_minimum_required (VERSION 2.8)
project(assignment4)


set(CMAKE_C_FLAGS "-std=c11 -Wall -Wextra -Wshadow -Werror -fPIC")
set(CMAKE_CXX_FLAGS "-std=c++11 -Wall -Wextra -Wshadow -Werror -fPIC")

# Read some documentation, do some googling, refer to things we've given you
# cmake is popular, so someone on the internet has had your problem before


include_directories("${PROJECT_SOURCE_DIR}/include")

# build a dynamic library called libblock_store.so
# note that the prefix lib will be automatically added in the filename.

add_library(block_store SHARED src/block_store.c include/block_store.h)

add_library(bitmap src/bitmap.c)

target_link_libraries(block_store PRIVATE bitmap)

# make an executable
add_executable(${PROJECT_NAME}_test test/tests.cpp)

# Enable grad/bonus tests by setting the variable to 1
target_compile_definitions(${PROJECT_NAME}_test PRIVATE GRAD_TESTS=0)

target_link_libraries(${PROJECT_NAME}_test block_store gtest pthread)

add_test (NAME ${PROJECT_NAME}_test COMMAND ${PROJECT_NAME}_test)
