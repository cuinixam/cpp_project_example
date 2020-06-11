# See https://cliutils.gitlab.io/modern-cmake/chapters/testing/googletest.html for more details or updates
macro(component_add_test TESTNAME FILES LIBRARIES)
    # create an exectuable in which the tests will be stored
    add_executable(${TESTNAME} ${FILES})
    # link the Google test infrastructure, mocking library, and a default main fuction to
    # the test executable.  Remove g_test_main if writing your own main function.
    target_link_libraries(${TESTNAME} gtest gmock gtest_main ${LIBRARIES})
    # All headers are in the src folder
    target_include_directories(${TESTNAME} PRIVATE ${PROJECT_SOURCE_DIR}/src)
    # gtest_discover_tests replaces gtest_add_tests,
    # see https://cmake.org/cmake/help/v3.10/module/GoogleTest.html for more options to pass to it
    gtest_discover_tests(${TESTNAME}
        # set a working directory so your project root so that you can find test data via paths relative to the project root
        # WORKING_DIRECTORY dir
        # Specifies the directory in which to run the discovered test cases. If this option is not provided, the current binary directory is used.
        WORKING_DIRECTORY ${PROJECT_DIR}
    )
    set_target_properties(${TESTNAME} PROPERTIES FOLDER test)
endmacro()

# Macro to add a 'trivial' component.
# A trivial component has one source, one header and one test file:
# <comp>.cpp, <comp>.h, <comp>_test.cpp
macro(add_component NAME)
    set(COMPONENT_TEST "${NAME}_test")
    # Component library
    add_library(${NAME} ${NAME}.cpp ${NAME}.h)
    # All headers are in the src folder
    target_include_directories(${NAME} PRIVATE ${PROJECT_SOURCE_DIR}/src)

    # Test component
    add_executable(${COMPONENT_TEST} ${NAME}_test.cpp)
    # link the Google test infrastructure, mocking library, and a default main fuction to
    # the test executable.  Remove g_test_main if writing your own main function.
    target_link_libraries(${COMPONENT_TEST} gtest gmock gtest_main ${NAME})
    # All headers are in the src folder
    target_include_directories(${COMPONENT_TEST} PRIVATE ${PROJECT_SOURCE_DIR}/src)
    # gtest_discover_tests replaces gtest_add_tests,
    # see https://cmake.org/cmake/help/v3.10/module/GoogleTest.html for more options to pass to it
    gtest_discover_tests(${COMPONENT_TEST}
        # set a working directory so your project root so that you can find test data via paths relative to the project root
        # WORKING_DIRECTORY dir
        # Specifies the directory in which to run the discovered test cases. If this option is not provided, the current binary directory is used.
        WORKING_DIRECTORY ${PROJECT_DIR}
    )
endmacro()
