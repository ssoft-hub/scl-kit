# Test- and benchmark-framework discovery is only needed when those targets are
# built; keeping it behind the gate avoids configuring and compiling bundled
# frameworks for header-only consumers.
if (SCL_BUILD_TESTS OR SCL_BUILD_BENCHMARKS)
    include(${CMAKE_CURRENT_LIST_DIR}/SCLDependencies.cmake)
endif()

# Route to module definitions
foreach(_module IN LISTS SCL_MODULES)
    add_subdirectory(
        ${PROJECT_SOURCE_DIR}/module/${_module}/project/cmake
        ${PROJECT_BINARY_DIR}/module/${_module}
    )
endforeach()

# Route to examples
if (SCL_BUILD_EXAMPLES)
    foreach(_module IN LISTS SCL_MODULES)
        add_subdirectory(
            ${PROJECT_SOURCE_DIR}/module/${_module}/project/cmake/example
            ${PROJECT_BINARY_DIR}/example/${_module}
        )
    endforeach()
endif()

# Route to tests
if (SCL_BUILD_TESTS)
    foreach(_module IN LISTS SCL_MODULES)
        add_subdirectory(
            ${PROJECT_SOURCE_DIR}/module/${_module}/project/cmake/test
            ${PROJECT_BINARY_DIR}/test/${_module}
        )
    endforeach()
endif()

# Route to benchmarks
if (SCL_BUILD_BENCHMARKS)
    foreach(_module IN LISTS SCL_MODULES)
        # Unlike example/ and test/, which every module carries, a benchmark
        # tree exists only where something has been measured.
        if (EXISTS "${PROJECT_SOURCE_DIR}/module/${_module}/project/cmake/benchmark/CMakeLists.txt")
            add_subdirectory(
                ${PROJECT_SOURCE_DIR}/module/${_module}/project/cmake/benchmark
                ${PROJECT_BINARY_DIR}/benchmark/${_module}
            )
        endif()
    endforeach()
endif()
