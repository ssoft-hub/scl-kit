# Central includes for third-party discovery and helper functions
include(${CMAKE_CURRENT_LIST_DIR}/SCLDependencies.cmake)

# Route to module definitions (utility, meta)
add_subdirectory(${CMAKE_SOURCE_DIR}/project/cmake/module ${CMAKE_BINARY_DIR}/module)

# Route to examples
if (SCL_BUILD_EXAMPLES)
    add_subdirectory(${CMAKE_SOURCE_DIR}/project/cmake/example ${CMAKE_BINARY_DIR}/example)
endif()

# Route to tests
if (SCL_BUILD_TESTS)
    add_subdirectory(${CMAKE_SOURCE_DIR}/project/cmake/test ${CMAKE_BINARY_DIR}/test)
endif()
