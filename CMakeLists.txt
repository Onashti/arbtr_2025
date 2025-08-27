cmake_minimum_required(VERSION 3.18)
project(fastlane LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

find_package(pybind11 REQUIRED)

add_library(fastlane MODULE
    fastlane.cpp
)

target_link_libraries(fastlane PRIVATE pybind11::module)
set_target_properties(fastlane PROPERTIES PREFIX "" OUTPUT_NAME "fastlane")
