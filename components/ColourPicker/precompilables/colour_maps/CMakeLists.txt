find_package(Qt6 REQUIRED COMPONENTS
    Gui
)

set(SOURCES private/qt_utilities.cpp private/colour_maps.cpp)

add_library(colour_maps_libs STATIC ${SOURCES})

target_link_libraries(colour_maps_libs PUBLIC
    Qt6::Gui
)

target_include_directories(colour_maps_libs INTERFACE
    public
)

add_executable(colour_maps main/main.cpp)
target_link_libraries(colour_maps PRIVATE
    colour_maps_libs
    Qt6::Gui
)

if (WIN32)
    add_custom_command(TARGET colour_maps POST_BUILD
        COMMAND 
            ${CMAKE_BINARY_DIR}/Release/colour_maps.exe 
                > ${CMAKE_BINARY_DIR}/Release/colour_maps.out
        WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
        BYPRODUCTS colour_maps.out
    )
elseif(UNIX)
    add_custom_command(TARGET colour_maps POST_BUILD
        COMMAND 
            ${CMAKE_BINARY_DIR}/colour_maps 
                > ${CMAKE_BINARY_DIR}/colour_maps.out
        WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
        BYPRODUCTS colour_maps.out
    )
endif()