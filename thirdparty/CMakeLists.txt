# googletest
option(INSTALL_GTEST "Enables installation of googletest" OFF)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/googletest)

# list all thirdparty libs
set(${PROJECT_NAME}_THIRDPARTY
    PARENT_SCOPE)
set(${PROJECT_NAME}_TEST_THIRDPARTY
    gtest
    gmock
    gtest_main
    gmock_main
    PARENT_SCOPE)
message(STATUS "Third party: ${${PROJECT_NAME}_THIRDPARTY}")
message(STATUS "Test third party: ${${PROJECT_NAME}_TEST_THIRDPARTY}")
