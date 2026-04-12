cmake_minimum_required(VERSION 3.16)

project(ScaraHMI VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appScaraHMI
    src/main.cpp
)

qt_add_qml_module(appScaraHMI
    URI ScaraHMI
    VERSION 1.0

    QML_FILES
        ui/Main.qml

    RESOURCES
        assets/fonts/SWISHBUT.TTF
)

target_link_libraries(appScaraHMI
    PRIVATE Qt6::Quick
)
