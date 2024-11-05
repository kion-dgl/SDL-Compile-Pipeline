cmake_minimum_required(VERSION 3.10)
project(ShadedTriangle_Vita)

set(CMAKE_C_STANDARD 99)

if(VITA)
    include("$ENV{VITASDK}/share/vita.cmake" REQUIRED)
    set(CMAKE_TOOLCHAIN_FILE "$ENV{VITASDK}/share/vita.toolchain.cmake")
endif()

add_executable(ShadedTriangle_Vita main.c)

target_link_libraries(ShadedTriangle_Vita SceGxm SceDisplay SceCtrl)
