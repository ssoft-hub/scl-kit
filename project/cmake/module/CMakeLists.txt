# Forward to actual module cmake roots
add_subdirectory(${CMAKE_SOURCE_DIR}/module/utility/project/cmake ${CMAKE_BINARY_DIR}/module/utility)
add_subdirectory(${CMAKE_SOURCE_DIR}/module/feature/project/cmake ${CMAKE_BINARY_DIR}/module/feature)
