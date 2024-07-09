add_subdirectory(precompilables/colour_maps)
find_package(
    Qt6 REQUIRED
    COMPONENTS
        Core
        Quick
        QuickControls2
)
qt_add_qml_module(ColourPicker
    URI components.ColourPicker
    VERSION 1.0
    STATIC
    QML_FILES
    qml/ColourPicker.qml
)
target_link_libraries(ColourPicker PUBLIC
    Qt::Core
    Qt::Quick
    Qt::QuickControls2
)