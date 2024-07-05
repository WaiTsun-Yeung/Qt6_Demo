find_package(
    Qt6 REQUIRED
    COMPONENTS
        Core
        Gui
        Quick
        QuickControls2
)

if(WIN32)
    qt_add_executable(qt6_demo
        WIN32
        src/main.cpp
    )
else()
    qt_add_executable(qt6_demo
        src/main.cpp
    )
endif(WIN32)

target_compile_definitions(qt6_demo PRIVATE QT_QML_DEBUG)

target_link_libraries(qt6_demo PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::Quick
    Qt6::QuickControls2
    TextEditor
)
qt_add_qml_module(qt6_demo
    URI main
    VERSION 1.0
    QML_FILES qml/main.qml
)

install(TARGETS qt6_demo
    BUNDLE  DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

qt_generate_deploy_qml_app_script(
    TARGET qt6_demo
    OUTPUT_SCRIPT deploy_script
    MACOS_BUNDLE_POST_BUILD
    NO_UNSUPPORTED_PLATFORM_ERROR
    DEPLOY_USER_QML_MODULES_ON_UNSUPPORTED_PLATFORM
)

install(SCRIPT ${deploy_script})
