import QtQuick
import QtQuick.Controls
Row{
    id: fontStylesRow

    property bool bold: false
    property bool italic: false
    property bool underline: false
    property bool strikeout: false
    readonly property list<var> styles:[
        {
            text: "B", 
            bold: true,
            italic: false,
            underline: false,
            strikeout: false,
            checkChangedAction: 
                checked => {fontStylesRow.bold = checked;}
        },
        {
            text: "I", 
            bold: false,
            italic: true,
            underline: false,
            strikeout: false,
            checkChangedAction: 
                checked => {fontStylesRow.italic = checked;}
        },
        {
            text: "U", 
            bold: false,
            italic: false,
            underline: true,
            strikeout: false,
            checkChangedAction: 
                checked => {fontStylesRow.underline = checked;}
        },
        {
            text: "S", 
            bold: false,
            italic: false,
            underline: false,
            strikeout: true,
            checkChangedAction: 
                checked => {fontStylesRow.strikeout = checked;}
        }
    ]
    Repeater{
        model: fontStylesRow.styles
        CheckBox{
            id: checkBox
            onCheckedChanged: 
                modelData.checkChangedAction(checked)
            Text{
                text: modelData.text
                anchors.left: checkBox.right
                anchors.verticalCenter: checkBox.verticalCenter
                font.bold: modelData.bold
                font.italic: modelData.italic
                font.underline: modelData.underline
                font.strikeout: modelData.strikeout
            }
        }
    }
}