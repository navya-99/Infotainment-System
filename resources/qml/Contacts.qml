import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Themes 1.0

Item {
    ListView{
        id: listview
        width: window.width
        height: 200

        //Connected to the ContactModel from the C++ side.
        model: contactModel

        //delegate : Defines how each item in the list is displayed
        delegate: ColumnLayout{
            width: parent.width
            spacing: DefaultTheme.radius

            Text {
                id: person
                font.pixelSize: DefaultTheme.fontSize
                color: DefaultTheme.textColor
                Layout.leftMargin: DefaultTheme.spacing
                text: model.name
            }
            Text {
                id: cnumber
                font.pixelSize: DefaultTheme.fontSize
                color: DefaultTheme.textColor
                Layout.leftMargin: DefaultTheme.spacing
                text: model.number
            }

            Rectangle{
                id: divider
                Layout.fillWidth: true
                height: 1
                opacity: 0.2
                color: DefaultTheme.textColor
            }
        }
    }
}
