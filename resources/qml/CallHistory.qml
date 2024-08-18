import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Themes 1.0

Item {
    // ListModel{
    //     id: historyModel
    //     ListElement{
    //         name: "Amma"
    //         number: "2924294"
    //         time: "10:30"
    //     }
    //     ListElement{
    //         name: "Nikitha"
    //         number: "2924294"
    //         time: "23:04"
    //     }
    //     ListElement{
    //         name: "Namitha"
    //         number: "2924294"
    //         time: "18:35"
    //     }
    // }

    ListView{
        id: listview
        anchors.fill: parent
        spacing: DefaultTheme.radius
        clip: true

        model: historyModel

        delegate: ColumnLayout{
            width: parent.width
            spacing: DefaultTheme.radius
            RowLayout{
                width: parent.width
                ColumnLayout{
                    Layout.fillWidth: true
                    spacing: DefaultTheme.radius
                    Text {
                        id: name
                        Layout.leftMargin: DefaultTheme.radius
                        font.pixelSize: DefaultTheme.fontSize
                        color: DefaultTheme.textColor
                        text: model.name
                    }
                    Text {
                        id: time
                        Layout.leftMargin: DefaultTheme.radius
                        font.pixelSize: DefaultTheme.fontSizeS
                        color: DefaultTheme.textColor
                        text: model.number + ", " + model.time
                    }
                }

                Item {
                    Layout.fillWidth: true
                }

                Text {
                    id: call
                    Layout.rightMargin: DefaultTheme.radius
                    font.pixelSize: DefaultTheme.fontSize
                    font.family: window.fontName
                    color: DefaultTheme.textColor
                    text: "\uf095"
                }
            }

            Rectangle{
                id: divider
                Layout.fillWidth: true
                height: 1
                opacity: 0.2
                color: DefaultTheme.textColor
            }
        }

        ScrollBar.vertical: ScrollBar {
        }
    }
}
