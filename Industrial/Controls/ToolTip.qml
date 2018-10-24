import QtQuick 2.6
import QtQuick.Controls 2.2 as T

T.ToolTip {
    id: control

    contentItem: Label {
        text: control.text
        font: control.font
        color: theme.onTipColor
        horizontalAlignment: Qt.AlignHCenter
    }

    background: Rectangle {
        color: theme.tipColor
        radius: 3

        MouseArea {
            anchors.fill: parent
            onPressed: control.close()
        }
    }
}