find_package(
    Qt6 REQUIRED
    COMPONENTS
        Core
        Quick
        QuickControls2
)
qt_add_qml_module(FontStyler
    URI components.FontStyler
    VERSION 1.0
    STATIC
    QML_FILES
    qml/FontStyler.qml
)
target_link_libraries(FontStyler PUBLIC
    Qt::Core
    Qt::Quick
    Qt::QuickControls2
)