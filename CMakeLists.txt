cmake_minimum_required(VERSION 3.15)

# Project details
project(
  "Project"
  VERSION 0.1.0
  LANGUAGES CXX)
string(TOLOWER ${PROJECT_NAME} PROJECT_NAME_LOWERCASE)
string(TOUPPER ${PROJECT_NAME} PROJECT_NAME_UPPERCASE)

# Settings
include(cmake/settings.cmake)
include(cmake/libs.cmake)
include(cmake/compile_warnings.cmake)
include(cmake/sources.cmake)

# Build
function(configure_project  name)
    target_compile_features(${name} PUBLIC ${PROJECT_CXX_VERSION})
    target_compile_options(${name} PUBLIC ${PROJECT_WARNINGS})
    target_include_directories(${name}
        PUBLIC
            $<INSTALL_INTERFACE:include>
            $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        PRIVATE
            ${CMAKE_CURRENT_SOURCE_DIR}/src)
    target_link_libraries(${name} PRIVATE ${PROJECT_LINK_LIBS})
    set_target_properties(
        ${name}
        PROPERTIES
        ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib/${CMAKE_BUILD_TYPE}"
        LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib/${CMAKE_BUILD_TYPE}"
        RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin/${CMAKE_BUILD_TYPE}")
endfunction()

add_library(${PROJECT_NAME}_lib ${sources} ${headers})
add_executable(${PROJECT_NAME} ${sources} ${headers})
configure_project(${PROJECT_NAME}_lib)
configure_project(${PROJECT_NAME})

# Unittest
if(${PROJECT_NAME}_BUILD_UNITTEST)
    enable_testing()
    add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/tests)
endif()
