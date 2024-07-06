import QtQuick
import QtQuick.Controls
import "qrc:/qt/qml/components/TextEditor/qml/"
import "qrc:/qt/qml/components/FontStyler/qml/"
ApplicationWindow {
    visible: true
    width: 400
    height: 300
    title: "Hello, World!"

    Text {
        id: centreText
        anchors.centerIn: parent
        readonly property string defaultText: "Hello, World!"
        text: defaultText
        font.pixelSize: 24
    }
    TextEditor{
        id: editor
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height / 100
        width: parent.width * 0.375
        height: parent.height / 15
        placeholderText: "Change text in the middle"
        onSetText: newText => centreText.text = newText;
        onResetText: centreText.text = centreText.defaultText;
    }
    FontStyler{
        id: fontStyler
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: editor.bottom
        anchors.topMargin: parent.height / 50
        spacing: parent.width / 25
        onBoldChanged: centreText.font.bold = bold
        onItalicChanged: centreText.font.italic = italic
        onUnderlineChanged: centreText.font.underline = underline
        onStrikeoutChanged: centreText.font.strikeout = strikeout
    }
}
