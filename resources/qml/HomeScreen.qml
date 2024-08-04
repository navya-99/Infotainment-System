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
        width: 200; height: 100
        color: DefaultTheme.buttonColor
        Text {
            id: box1text
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
}
