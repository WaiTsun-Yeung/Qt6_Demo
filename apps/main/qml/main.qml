import QtQuick
import QtQuick.Controls
import "qrc:/qt/qml/components/TextEditor/qml/"
import "qrc:/qt/qml/components/FontStyler/qml/"
import "qrc:/qt/qml/components/ColourPicker/qml/"
ApplicationWindow {
    width: 400
    height: 400
    visible: true
    title: "Hello, World!"

    TextEditor{
        id: editor
        width: parent.width * 0.375
        height: parent.height / 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height / 100
        placeholderText: "Change text in the middle"
        onSetText: newText => centreText.text = newText;
        onResetText: () => centreText.text = centreText.defaultText;
    }
    FontStyler{
        id: fontStyler
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: editor.bottom
        anchors.topMargin: parent.height / 50
        spacing: parent.width / 25
    }
    ComboBox{
        id: fontSelector
        readonly property double widthFactor: 0.2
        implicitWidth: 210
        width: Math.max(implicitWidth, parent.width * widthFactor)
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: fontStyler.bottom
        anchors.topMargin: parent.height / 50
        model: Qt.fontFamilies()
        currentIndex: model.indexOf(centreText.font.family)
        onCurrentTextChanged: centreText.font.family = currentText
    }
    ColourPicker{
        id: colourPicker
        width: Math.max(300, parent.width / 2)
        height: Math.max(130, parent.height / 4)
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height / 50
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Text {
        id: centreText
        readonly property string defaultText: "Hello, World!"
        anchors.centerIn: parent
        text: defaultText
        font.pixelSize: 24
        font.bold: fontStyler.bold
        font.italic: fontStyler.italic
        font.underline: fontStyler.underline
        font.strikeout: fontStyler.strikeout
    }
}
