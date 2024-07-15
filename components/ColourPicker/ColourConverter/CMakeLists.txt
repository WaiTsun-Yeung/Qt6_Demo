find_package(Qt6 REQUIRED
    COMPONENTS
        Core
        Gui
        Qml
)
qt_add_qml_module(ColourConverter
    URI components.ColourPicker.ColourConverter
    VERSION 1.0
    STATIC
    CLASS_NAME ColourConverter
    SOURCES ColourConverter.hpp private/ColourConverter.cpp
)
target_include_directories(ColourConverter PUBLIC .)
target_link_libraries(ColourConverter PUBLIC
    Qt6::Gui
)
target_link_libraries(ColourConverter INTERFACE
    Qt6::Core
    Qt6::Qml
)
target_link_libraries(ColourConverter PRIVATE
    colour_models_lib
)