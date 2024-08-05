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

    Text {
        id: header
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: DefaultTheme.margins
        anchors.topMargin: DefaultTheme.margins
        font.pixelSize: DefaultTheme.fontSizeL
        color: DefaultTheme.textColor
        text: qsTr("Infotainment")
    }

    Rectangle{
        id: box1
        anchors.left: header.left
        anchors.top: header.bottom
        anchors.topMargin: DefaultTheme.margins
        width: DefaultTheme.appWidth
        height: DefaultTheme.appHeight
        color: DefaultTheme.buttonColor
        Text {
            anchors.centerIn: parent
            font.pixelSize: DefaultTheme.fontSize
            color: DefaultTheme.textColor
            text: qsTr("Map")
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
        anchors.topMargin: DefaultTheme.margins
        width: DefaultTheme.appWidth
        height: DefaultTheme.appHeight
        color: DefaultTheme.buttonColor
        Text {
            anchors.centerIn: parent
            font.pixelSize: DefaultTheme.fontSize
            color: DefaultTheme.textColor
            text: qsTr("Music")
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
        anchors.left: header.left
        width: DefaultTheme.appWidth
        height: DefaultTheme.appHeight
        color: DefaultTheme.buttonColor
        Text {
            anchors.centerIn: parent
            font.pixelSize: DefaultTheme.fontSize
            color: DefaultTheme.textColor
            text: qsTr("Phone")
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
        width: DefaultTheme.appWidth
        height: DefaultTheme.appHeight
        color: DefaultTheme.buttonColor
        Text {
            anchors.centerIn: parent
            font.pixelSize: DefaultTheme.fontSize
            color: DefaultTheme.textColor
            text: qsTr("Settings")
        }
        MouseArea {
            anchors.fill: parent
            onClicked: stack.push("qrc:/qml/SettingScreen.qml")
        }
    }
}
