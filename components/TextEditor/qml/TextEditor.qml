import QtQuick
import QtQuick.Controls
Rectangle{
    id: textEditor

    property string placeholderText

    signal setText(string text)
    signal resetText()

    TextField {
        id: textEdit
        width: parent.width - textReset.width
        height: parent.height
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        placeholderText: textEditor.placeholderText
        onTextChanged: {
            textEditor.setText(text)
        }
    }
    Button {
        id: textReset
        anchors.right: parent.right
        readonly property int minWidth: 50
        readonly property double widthFactor: 0.2
        width: Math.max(minWidth, parent.width * widthFactor)
        height: parent.height
        text: "Reset Text"
        onClicked: {
            textEdit.text = ""
            textEditor.resetText()
        }
    }
}
