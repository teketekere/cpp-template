# Options
option(${PROJECT_NAME}_BUILD_UNITTEST "Build unittest" ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(PROJECT_CXX_VERSION cxx_std_20)

# Export all symbols when building a shared library
if(BUILD_SHARED_LIBS)
  set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS OFF)
  set(CMAKE_CXX_VISIBILITY_PRESET hidden)
  set(CMAKE_VISIBILITY_INLINES_HIDDEN 1)
endif()

# Build/Release
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Release")
endif()

# LTO
option(${PROJECT_NAME}_ENABLE_LTO "Enable Interprocedural Optimization, aka Link Time Optimization (LTO)." OFF)
if(${PROJECT_NAME}_ENABLE_LTO)
  include(CheckIPOSupported)
  check_ipo_supported(RESULT result OUTPUT output)
  if(result)
    set(CMAKE_INTERPROCEDURAL_OPTIMIZATION TRUE)
  else()
    message(SEND_ERROR "IPO is not supported: ${output}.")
  endif()
endif()

# Print settings
message(STATUS "${PROJECT_NAME}: v${PROJECT_VERSION}")
message(STATUS "C++: ${CMAKE_CXX_COMPILER}-${PROJECT_CXX_VERSION}")
message(STATUS "Shared lib: ${BUILD_SHARED_LIBS}")
message(STATUS "Build: ${CMAKE_BUILD_TYPE}")
message(STATUS "LTO: ${${PROJECT_NAME}_ENABLE_LTO}")
