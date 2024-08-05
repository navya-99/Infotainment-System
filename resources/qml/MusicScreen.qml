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
        text: qsTr("Music Screen")
    }

    MouseArea {
          anchors.fill: parent
          onClicked: stack.pop()
    }
}
