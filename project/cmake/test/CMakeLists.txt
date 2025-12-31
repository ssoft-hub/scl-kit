# Forward to per-module tests
add_subdirectory(${CMAKE_SOURCE_DIR}/module/utility/project/cmake/test ${CMAKE_BINARY_DIR}/test_utility)
add_subdirectory(${CMAKE_SOURCE_DIR}/module/feature/project/cmake/test    ${CMAKE_BINARY_DIR}/test_feature)
