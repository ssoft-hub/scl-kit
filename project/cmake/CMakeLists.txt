# Test-framework discovery is only needed when tests are built; keeping it
# behind the gate avoids configuring and compiling bundled frameworks for
# header-only consumers.
if (SCL_BUILD_TESTS)
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
