cmake_minimum_required(VERSION 3.10)

project(CppProject CXX)

# Add the cmake folder to the search path for CMake modules
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
include(utils)

enable_testing()
include(GoogleTest)
add_subdirectory("${PROJECT_SOURCE_DIR}/extern/gtest" "extern/gtest")
mark_as_advanced(
    BUILD_GMOCK BUILD_GTEST BUILD_SHARED_LIBS
    gmock_build_tests gtest_build_samples gtest_build_tests
    gtest_disable_pthreads gtest_force_shared_crt gtest_hide_internal_symbols
)

add_subdirectory(src)
