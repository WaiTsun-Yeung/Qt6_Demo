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
    ComboBox{
        id: fontSelector
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: fontStyler.bottom
        anchors.topMargin: parent.height / 50
        readonly property int minWidth: 210
        readonly property double widthFactor: 0.2
        width: Math.max(minWidth, parent.width * widthFactor)
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
        onPickedColourChanged: centreText.color = pickedColour
    }
}
