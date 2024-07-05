find_package(
    Qt6 REQUIRED
    COMPONENTS
        Core
        Quick
        QuickControls2
)
qt_add_qml_module(TextEditor
    URI components.TextEditor
    VERSION 1.0
    STATIC
    QML_FILES
    qml/TextEditor.qml
)
target_link_libraries(TextEditor PUBLIC
    Qt::Core
    Qt::Quick
    Qt::QuickControls2
)
