import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

// import Controls 1.0
import Themes 1.0

Rectangle {
    id: root
    width: window.width
    height: window.height
    color: DefaultTheme.backgroundColor

    property int index: StackView.index
    onIndexChanged: index > 0 ? drawer.open() : drawer.close()

    Text{
        id: backbtn
        anchors.bottom: dialbtn.top
        anchors.bottomMargin: DefaultTheme.radius
        anchors.right: parent.right
        anchors.rightMargin: DefaultTheme.radius
        font.family: window.fontName
        color: DefaultTheme.textColor
        font.pixelSize: DefaultTheme.fontSize
        z: 1
        text: "\uf137"
        MouseArea{
            anchors.fill: parent
            onClicked: stack.pop()
        }
    }

    Text{
        id: dialbtn
        anchors.bottom: parent.bottom
        anchors.bottomMargin: DefaultTheme.radius
        anchors.right: parent.right
        anchors.rightMargin: DefaultTheme.radius
        font.family: window.fontName
        color: DefaultTheme.textColor
        font.pixelSize: DefaultTheme.fontSize
        z: 1
        text: "\uf13a"
        MouseArea{
            anchors.fill: parent
            onClicked: drawer.open()
        }
    }

    TabBar {
        id: phonetab
        width: parent.width
        position: TabBar.Header

        TabButton {
            text: qsTr("Call History")
            font.pixelSize: DefaultTheme.fontSizeS
        }

        TabButton {
            text: qsTr("Contacts")
            font.pixelSize: DefaultTheme.fontSizeS
        }
    }

    StackLayout {
        width: parent.width
        height: parent.height
        currentIndex: phonetab.currentIndex
        anchors.top: phonetab.bottom
        anchors.topMargin: DefaultTheme.spacing
        anchors.bottom: parent.bottom
        anchors.bottomMargin: DefaultTheme.spacing

        CallHistory {
            id: historyTab
        }
        Contacts {
            id: contactsTab
        }
    }

    Drawer {
        id: drawer
        width: window.width
        height: window.height * 0.6
        edge: Qt.BottomEdge
        background: Rectangle{
            color: DefaultTheme.buttonColor
            width: drawer.width
            height: drawer.height
        }

        ColumnLayout {
            anchors.fill: parent
            spacing: 0
            //first
            TextField {
                id: dialscreen
                Layout.preferredWidth: drawer.width
                Layout.preferredHeight: drawer.height * 0.2
                font.pixelSize: DefaultTheme.fontSize
                horizontalAlignment: TextInput.AlignHCenter
                readOnly: true
                color: DefaultTheme.textColor
                background: Item {
                }
                Text {
                    anchors.right: dialscreen.right
                    anchors.rightMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                    font.family: window.fontName
                    color: DefaultTheme.textColor
                    font.pixelSize: DefaultTheme.fontSize
                    text: "\u232b"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: dialscreen.remove(dialscreen.length-1,dialscreen.length)
                    }
                }
            }

            //divider
            Rectangle{
                id: divider
                Layout.fillWidth: true
                height: 1
                opacity: 0.2
                color: DefaultTheme.textColor
            }

            //second
            GridLayout {
                id: dialpad
                columns: 3
                Layout.preferredWidth: drawer.width
                Layout.preferredHeight: drawer.height * 0.6
                Layout.leftMargin: DefaultTheme.margins2
                Layout.rightMargin: DefaultTheme.margins2
                Layout.margins: DefaultTheme.spacing
                rowSpacing: 5
                columnSpacing: 5
                Repeater {
                    model: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "*", "0", "#"]
                    Rectangle{
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        color: DefaultTheme.backgroundColor
                        radius: DefaultTheme.spacing
                        Text {
                           anchors.centerIn: parent
                           font.pixelSize: DefaultTheme.fontSizeS
                           color: DefaultTheme.textColor
                           text: modelData
                        }
                        MouseArea{
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: dialscreen.insert(dialscreen.length, modelData)
                        }
                    }
                }
            }

            //third
            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: drawer.height * 0.2
                Rectangle {
                    id: callbtn
                    anchors.centerIn: parent
                    width: parent.width * 0.2
                    height: parent.height * 0.6
                    radius: DefaultTheme.spacing
                    color: "#1DAB7E"
                    Text {
                        anchors.centerIn: parent
                        font.pixelSize: DefaultTheme.fontSizeS
                        font.family: window.fontName
                        color: DefaultTheme.textColor
                        text: "\uf095"
                    }
                }
            }
        }
    }
}
