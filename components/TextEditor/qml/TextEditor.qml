import QtQuick
import QtQuick.Controls
Rectangle{
    id: textEditor

    property alias placeholderText: textEdit.placeholderText

    signal setText(string text)
    signal resetText()

    TextField {
        id: textEdit
        width: parent.width - textReset.width
        height: parent.height
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        onTextChanged: {
            textEditor.setText(text)
        }
    }
    Button {
        id: textReset
        readonly property double widthFactor: 0.2
        anchors.right: parent.right
        implicitWidth: 50
        width: Math.max(implicitWidth, parent.width * widthFactor)
        height: parent.height
        text: "Reset Text"
        onClicked: {
            textEdit.text = ""
            textEditor.resetText()
        }
    }
}
