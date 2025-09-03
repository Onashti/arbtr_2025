cmake_minimum_required(VERSION 3.16)
project(arbitrage_bot)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -march=native")

# Debug: Print CMake prefix path
message("CMAKE_PREFIX_PATH: ${CMAKE_PREFIX_PATH}")

# Add pybind11 CMake path
list(APPEND CMAKE_PREFIX_PATH "${CMAKE_SOURCE_DIR}/venv/lib/python3.12/site-packages/pybind11/share/cmake/pybind11")

# Find Python from venv
set(Python3_ROOT_DIR "${CMAKE_SOURCE_DIR}/venv")
find_package(Python3 REQUIRED COMPONENTS Interpreter Development.Module Development.Embed)

# Find other dependencies
find_package(pybind11 REQUIRED)
find_package(Boost REQUIRED COMPONENTS system)
find_package(CURL REQUIRED)
find_package(spdlog REQUIRED)
find_package(OpenSSL REQUIRED)

# Debug: Print found paths
message("Python3_EXECUTABLE: ${Python3_EXECUTABLE}")
message("Python3_INCLUDE_DIRS: ${Python3_INCLUDE_DIRS}")
message("Python3_LIBRARIES: ${Python3_LIBRARIES}")
message("pybind11_INCLUDE_DIRS: ${pybind11_INCLUDE_DIRS}")

# Add module
pybind11_add_module(arbitrage_module
    src/cpp/bindings.cpp
    src/cpp/arbitrage.cpp
)

target_include_directories(arbitrage_module PRIVATE
    ${Boost_INCLUDE_DIRS}
    ${CURL_INCLUDE_DIRS}
    /usr/include/x86_64-linux-gnu # Для curl.h
    ${OPENSSL_INCLUDE_DIR}
)

target_link_libraries(arbitrage_module PRIVATE
    ${Boost_LIBRARIES}
    ${CURL_LIBRARIES}
    spdlog::spdlog
    OpenSSL::Crypto
    Python3::Module
)

# Output to python dir with exact name
set_target_properties(arbitrage_module PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/src/python"
    OUTPUT_NAME "arbitrage_module"
    PREFIX ""
    SUFFIX ".so"
)
