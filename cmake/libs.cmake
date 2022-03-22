add_subdirectory(${CMAKE_SOURCE_DIR}/thirdparty)
set(PROJECT_LINK_LIBS
    ${${PROJECT_NAME}_THIRDPARTY})

# Print
message(STATUS "libs: ${PROJECT_LINK_LIBS}")
