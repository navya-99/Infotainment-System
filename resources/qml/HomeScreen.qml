/***************************************************************************/
/*! \file       HomeScreen.qml
 * \brief       the home screen of the infotainment app
 *
 * \copyright   Copyright (c) 2024 Navya Padiyar
 * \copyright   MIT License
 *
 * \remark      Email: padiyarnavya@gmail.com
 ***************************************************************************/

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

// import Controls 1.0
import Themes 1.0

Rectangle {
    id: root
    anchors.fill: parent
    color: DefaultTheme.backgroundColor

    property real cellWidth: (window.width - 100) / 2
    property real cellHeight: (window.height - 40) / 3

    Timer {
        interval: 3000; running: true; repeat: true
        onTriggered: header.text = Qt.formatDateTime(new Date(), "hh:mm")
    }

    Text {
        id: header
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: DefaultTheme.margins
        font.pixelSize: DefaultTheme.fontSize
        color: DefaultTheme.textColor
        text: qsTr("Infotainment")
    }

    Rectangle{
        width: parent.width
        height: 1
        opacity: 0.2
        color: DefaultTheme.textColor
        anchors.top: header.bottom
    }

    Rectangle{
        id: box1
        anchors.left: root.left
        anchors.leftMargin: DefaultTheme.margins2
        anchors.top: header.bottom
        anchors.topMargin: DefaultTheme.margins2
        width: cellWidth
        height: cellHeight
        color: DefaultTheme.buttonColor
        radius: DefaultTheme.radius
        Text {
            anchors.centerIn: parent
            font.pixelSize: DefaultTheme.fontSizeL
            font.family: window.fontName
            color: DefaultTheme.textColor
            text: "\uf041"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: stack.push("qrc:/qml/MapsScreen.qml")
        }
    }

    Rectangle{
        id: box2
        anchors.left: box1.right
        anchors.leftMargin: DefaultTheme.margins
        anchors.top: header.bottom
        anchors.topMargin: DefaultTheme.margins2
        width: cellWidth
        height: cellHeight
        color: DefaultTheme.buttonColor
        radius: DefaultTheme.radius
        Text {
            anchors.centerIn: parent
            font.pixelSize: DefaultTheme.fontSizeL
            font.family: window.fontName
            color: DefaultTheme.textColor
            text: "\uf001"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: stack.push("qrc:/qml/MusicScreen.qml")
        }
    }

    Rectangle{
        id: box3
        anchors.top: box1.bottom
        anchors.topMargin: DefaultTheme.margins
        anchors.left: box1.left
        width: cellWidth
        height: cellHeight
        color: DefaultTheme.buttonColor
        radius: DefaultTheme.radius
        Text {
            anchors.centerIn: parent
            font.pixelSize: DefaultTheme.fontSizeL
            font.family: window.fontName
            color: DefaultTheme.textColor
            text: "\uf095"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: stack.push("qrc:/qml/PhoneScreen.qml")
        }
    }

    Rectangle{
        id: box4
        anchors.top: box2.bottom
        anchors.topMargin: DefaultTheme.margins
        anchors.left: box3.right
        anchors.leftMargin: DefaultTheme.margins
        width: cellWidth
        height: cellHeight
        color: DefaultTheme.buttonColor
        radius: DefaultTheme.radius
        Text {
            anchors.centerIn: parent
            font.pixelSize: DefaultTheme.fontSizeL
            font.family: window.fontName
            color: DefaultTheme.textColor
            text: "\uf085"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: stack.push("qrc:/qml/SettingScreen.qml")
        }
    }
}
