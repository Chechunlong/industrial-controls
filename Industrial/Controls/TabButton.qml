import QtQuick 2.6
import QtQuick.Templates 2.2 as T

import "../Shaders" as Shaders

T.TabButton {
    id: control

    property bool flat: false

    property alias iconSource: content.iconSource
    property alias iconColor: content.iconColor
    property alias textColor: content.textColor
    property alias backgroundColor: backgroundItem.color

    font.pixelSize: controlSize.fontSize
    implicitWidth: content.implicitWidth
    implicitHeight: controlSize.baseSize
    clip: true

    background: Rectangle {
        id: backgroundItem
        anchors.fill: parent
        border.color: control.activeFocus ? customPalette.highlightColor : "transparent"
        radius: 3
        color: {
            if (control.checked || control.highlighted) return customPalette.selectionColor;
            if (control.pressed) return customPalette.highlightColor;
            return control.flat ? "transparent" : customPalette.buttonColor;
        }

        Shaders.Hatch {
            anchors.fill: parent
            color: customPalette.sunkenColor
            visible: !control.enabled
        }
    }

    contentItem: ContentItem {
        id: content
        horizontalAlignment: Text.AlignHCenter
        text: control.text
        font: control.font
        textColor: pressed || checked ? customPalette.selectedTextColor: customPalette.textColor
    }
}

