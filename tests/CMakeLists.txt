# Test Project
project(${CMAKE_PROJECT_NAME}Tests LANGUAGES CXX)

# Settigns
include(CTest)
include(GoogleTest)

# Build
foreach(file ${test_sources})
    string(REGEX REPLACE "(.*/)([a-zA-Z0-9_ ]+)(\.cpp)" "\\2" test_name ${file})
    add_executable(${test_name}_test ${file} ${test_headers})

    target_compile_features(${test_name}_test PUBLIC ${PROJECT_CXX_VERSION})
    target_compile_options(${test_name}_test PUBLIC ${PROJECT_WARNINGS})
    target_include_directories(${test_name}_test
        PUBLIC
            $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/tests/include>
        PRIVATE
            ${CMAKE_SOURCE_DIR}/tests/src)
    target_link_libraries(${test_name}_test PRIVATE
        ${CMAKE_PROJECT_NAME}_lib
        ${PROJECT_LINK_LIBS}
        ${PROJECT_TEST_LINK_LIBS})

    set_target_properties(
        ${test_name}_test
        PROPERTIES
        ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib/${CMAKE_BUILD_TYPE}"
        LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib/${CMAKE_BUILD_TYPE}"
        RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin/${CMAKE_BUILD_TYPE}")

    add_test(
        NAME ${test_name}
        COMMAND ${test_name}_test)
endforeach()
