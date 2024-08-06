import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
// import QtQuick.VirtualKeyboard 2.15

import Themes 1.0

Window {
    id: window
    width: DefaultTheme.width
    height: DefaultTheme.height
    visible: true
    flags: Qt.FramelessWindowHint

    property alias fontName: fontLoader.name

    FontLoader{
        id: fontLoader
        source: "qrc:/fonts/fontawesome.otf"
    }

    HomeScreen{
        id: mainView
        anchors.fill: parent
    }

    StackView {
        id: stack
        initialItem: mainView
        anchors.fill: parent
    }
}
