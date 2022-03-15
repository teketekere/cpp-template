# Headers
file(GLOB_RECURSE headers "${CMAKE_SOURCE_DIR}/include/*.hpp")
set(headers ${headers})

# Sources
file(GLOB_RECURSE sources "${CMAKE_SOURCE_DIR}/src/*.cpp")
set(sources ${sources})

# Test Headers
file(GLOB_RECURSE test_headers "${CMAKE_SOURCE_DIR}/tests/include/*.hpp")
set(test_headers ${test_headers})

# Test Sources
file(GLOB_RECURSE test_sources "${CMAKE_SOURCE_DIR}/tests/src/*.cpp")
set(test_sources ${test_sources})
