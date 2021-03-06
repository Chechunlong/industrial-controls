import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.Switch {
    id: control

    property bool inputChecked: checked
    property alias textColor: text.color
    property alias backgroundColor: backgroundItem.color
    property string tipText

    implicitWidth: contentItem.implicitWidth
    implicitHeight: Theme.baseSize
    spacing: Theme.spacing
    focusPolicy: Qt.NoFocus
    hoverEnabled: true
    font.pixelSize: Theme.mainFontSize

    onInputCheckedChanged: if (checked != inputChecked) checked = inputChecked

    indicator: Rectangle {
        id: backgroundItem
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        implicitWidth: Theme.baseSize
        implicitHeight: Theme.fill
        radius: height / 2
        color: control.checked ? Theme.selectionColor : Theme.containerColor

        Hatch {
            anchors.fill: parent
            color: Theme.surfaceColor
            visible: !control.enabled
        }

        Handle {
            x: control.checked ? parent.width - width : 0
            anchors.verticalCenter: parent.verticalCenter

            Behavior on x { PropertyAnimation { duration: Theme.animationTime} }
        }
    }

    contentItem: Label {
        id: text
        text: control.text
        font: control.font
        leftPadding: indicator.width + control.spacing
    }

    ToolTip {
        visible: (hovered || down) && tipText
        text: tipText
        delay: 1000
    }
}
