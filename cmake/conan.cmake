set(${PROJECT_NAME}_CONAN_REQUIRES
    "gtest/1.11.0"
)
set(${PROJECT_NAME}_CONAN_OPTIONS
    ""
)

#
# If `conan.cmake` (from https://github.com/conan-io/cmake-conan) does not exist, download it.
#
if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
    message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
    file(DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/master/conan.cmake" "${CMAKE_BINARY_DIR}/conan.cmake")
endif()

include(${CMAKE_BINARY_DIR}/conan.cmake)

conan_cmake_run(
  REQUIRES
  ${${PROJECT_NAME}_CONAN_REQUIRES}
  OPTIONS
  ${${PROJECT_NAME}_CONAN_OPTIONS}
  BASIC_SETUP
  CMAKE_TARGETS # Individual targets to link to
  BUILD
  missing
)
conan_basic_setup()

message(STATUS "Conan is setup and all requires have been installed.")
