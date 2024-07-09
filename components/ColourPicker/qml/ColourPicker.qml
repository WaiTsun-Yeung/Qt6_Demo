import QtQuick
import QtQuick.Controls
Rectangle{
    color: "transparent"
    Rectangle {
        id: colourGradient
        width: parent.width - pickedColour.width
        height: parent.height
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        color: "red"
    }
    Rectangle {
        id: pickedColour
        height: parent.height / 2
        width: Math.min(Math.max(50, height * 1.618), parent.width / 4)
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        color: "blue"
    }
}