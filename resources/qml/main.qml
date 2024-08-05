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

    HomeScreen{
        id: mainView
        anchors.fill: parent
    }

    StackView {
        id: stack
        initialItem: mainView
        anchors.fill: parent
    }


    // InputPanel {
    //     id: inputPanel
    //     z: 99
    //     x: 0
    //     y: window.height
    //     width: window.width

    //     states: State {
    //         name: "visible"
    //         when: inputPanel.active
    //         PropertyChanges {
    //             target: inputPanel
    //             y: window.height - inputPanel.height
    //         }
    //     }
    //     transitions: Transition {
    //         from: ""
    //         to: "visible"
    //         reversible: true
    //         ParallelAnimation {
    //             NumberAnimation {
    //                 properties: "y"
    //                 duration: 250
    //                 easing.type: Easing.InOutQuad
    //             }
    //         }
    //     }
    // }
}
