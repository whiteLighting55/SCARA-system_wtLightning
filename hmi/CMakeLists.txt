cmake_minimum_required(VERSION 3.16)

project(ScaraHMI VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appScaraHMI
    src/main.cpp
)



qt_add_resources(appScaraHMI "qml"
    PREFIX "/"
    FILES
        ui/Main.qml
        assets/fonts/SWISHBUT.TTF
)

find_package(Qt6 REQUIRED COMPONENTS Quick SerialPort)
target_sources(appScaraHMI PRIVATE
    src/SerialHandler.cpp
)

target_link_libraries(appScaraHMI
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Quick Qt6::SerialPort
)
