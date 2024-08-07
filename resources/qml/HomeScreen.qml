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

    Timer {
        interval: 3000; running: true; repeat: true
        onTriggered: header.text = Qt.formatDateTime(new Date(), "hh:mm")
    }

    Text {
        id: header
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: DefaultTheme.spacing
        font.pixelSize: DefaultTheme.fontSize
        color: DefaultTheme.textColor
        text: qsTr("Infotainment")
    }

    Rectangle{
        id: divider
        width: parent.width
        height: 1
        opacity: 0.2
        color: DefaultTheme.textColor
        anchors.top: header.bottom
    }

    GridLayout{
        id: grid
        columns: 2
        anchors.fill: parent
        anchors.margins: DefaultTheme.margins2
        rowSpacing: DefaultTheme.margins
        columnSpacing: DefaultTheme.margins

        Repeater{
            model: [
                {icon: "\uf041", url: "qrc:/qml/MapsScreen.qml" },
                {icon: "\uf001", url: "qrc:/qml/MusicScreen.qml" },
                {icon: "\uf095", url: "qrc:/qml/PhoneScreen.qml" },
                {icon: "\uf085", url: "qrc:/qml/SettingScreen.qml" }
            ]
            Rectangle{
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: Qt.rgba(195, 196, 201, 0.1)
                radius: DefaultTheme.radius
                Text {
                    anchors.centerIn: parent
                    font.pixelSize: DefaultTheme.fontSizeL
                    font.family: window.fontName
                    color: DefaultTheme.textColor
                    text: modelData.icon
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: stack.push(modelData.url)
                }
            }
        }

    }
}
