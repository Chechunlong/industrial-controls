import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.Slider {
    id: control

    property real visualValue: from + position * (to - from)
    property alias text: textItem.text

    implicitWidth: Theme.baseSize * 6
    implicitHeight: handle.height + topPadding
    topPadding: textItem.visible ? textItem.contentHeight : 0
    focusPolicy: Qt.NoFocus
    hoverEnabled: true

    background: Rectangle {
        x: control.leftPadding
        y: control.topPadding + control.availableHeight / 2 - height / 2
        implicitWidth: Theme.baseSize * 6
        width: control.availableWidth
        height: Theme.fill
        radius: height / 2
        color: Theme.containerColor

        Rectangle {
            width: control.visualPosition * parent.width
            height: parent.height
            color: Theme.selectionColor
            radius: height / 2
        }

        Hatch {
            anchors.fill: parent
            color: Theme.surfaceColor
            visible: !enabled
        }
    }

    handle: Handle {
        id: handle
        x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
        y: control.topPadding + control.availableHeight / 2 - height / 2

        Rectangle {
            anchors.centerIn: parent
            width: parent.width * 2
            height: width
            radius: width / 2
            color: Theme.highlightColor
            opacity: 0.5
            visible: control.pressed
        }
    }

    Text {
        id: textItem
        anchors.left: parent.left
        anchors.top: parent.top
        visible: text.length
        font.pixelSize: Theme.auxFontSize
        color: {
            if (!control.enabled) return Theme.disabledColor;
            if (control.activeFocus) return Theme.selectionColor;

            return Theme.onSurfaceColor;
        }
        Behavior on font.pixelSize { PropertyAnimation { duration: Theme.animationTime } }
    }

    ToolTip {
        parent: handle
        visible: hovered || pressed
        text: visualValue.toFixed(0)
    }
}
