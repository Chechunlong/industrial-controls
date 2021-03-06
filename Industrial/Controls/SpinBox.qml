import QtQuick 2.9
import QtQuick.Templates 2.2 as T

T.SpinBox {
    id: control

    property bool isValid: value >= from && value <= to
    property color color: Theme.onContainerColor
    property bool round: false

    property alias caution: background.caution
    property alias backgroundColor: background.color
    property alias labelText: background.text
    property alias flat: background.flat

    implicitWidth: background.implicitWidth + Theme.baseSize * 2
    implicitHeight: Math.max(background.textHeight + contentItem.implicitHeight +
                             background.underline, Theme.baseSize)
    leftPadding: Theme.baseSize
    rightPadding: Theme.baseSize
    font.pixelSize: Theme.mainFontSize
    editable: true
    hoverEnabled: true
    clip: true
    to: 100

    Connections {
        target: up
        onPressedChanged: if (!control.activeFocus) control.forceActiveFocus()
    }

    Connections {
        target: down
        onPressedChanged: if (!control.activeFocus) control.forceActiveFocus()
    }

    validator: IntValidator {
        bottom: Math.min(control.from, control.to)
        top: Math.max(control.from, control.to)
    }

    background: BackgroundInput {
        id: background
        x: Theme.baseSize
        width: control.width - Theme.baseSize * 2
        height: control.height
        radius: 0
        highlighted: control.activeFocus
        isValid: control.isValid
    }

    contentItem: Item {
        anchors.centerIn: parent
        implicitHeight: input.contentHeight

        NumericInput {
            id: input
            anchors.fill: parent
            anchors.bottomMargin: background.underline * 1.5
            Binding on text { value: control.textFromValue(control.value, control.locale) }
            onTextEdited: control.value = control.valueFromText(text, control.locale)
            maximumLength: control.to.toString().length
            color: control.enabled ? control.color : Theme.disabledColor
            selectionColor: background.highlighterColor
            selectedTextColor: control.activeFocus ? Theme.onSelectionColor : Theme.onContainerColor
            clip: true
            font: control.font
            readOnly: !control.editable
            inputMethodHints: Qt.ImhDigitsOnly
            validator: control.validator
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: labelText.length > 0 ? Text.AlignBottom : Text.AlignVCenter
        }
    }

    down.indicator: BackgroundItem {
        x: control.mirrored ? parent.width - width : 0
        width: Theme.baseSize
        height: parent.height
        radius: round ? Math.min(width, height) / 2 : Theme.rounding
        rightCroppig: radius
        bottomCroppig: round ? 0 : radius
        color: down.pressed && enabled ? Theme.highlightColor : background.color
        hovered: down.hovered

        Hatch {
            anchors.fill: parent
            color: Theme.surfaceColor
            visible: !enabled
        }

        ColoredIcon {
            anchors.centerIn: parent
            width: parent.width - Theme.padding * 2
            source: "qrc:/icons/minus.svg"
            color: {
                if (!enabled) return Theme.disabledColor;
                if (down.pressed) return Theme.onHighlightColor;

                return Theme.onButtonColor;
            }
        }
    }

    up.indicator: BackgroundItem {
        x: control.mirrored ? 0 : parent.width - width
        width: Theme.baseSize
        height: parent.height
        radius: round ? Math.min(width, height) / 2 : Theme.rounding
        leftCroppig: radius
        bottomCroppig: round ? 0 : radius
        color: up.pressed && enabled ? Theme.highlightColor : background.color
        hovered: up.hovered

        Hatch {
            anchors.fill: parent
            color: Theme.surfaceColor
            visible: !enabled
        }

        ColoredIcon {
            anchors.centerIn: parent
            width: parent.width - Theme.padding * 2
            source: "qrc:/icons/plus.svg"
            color: {
                if (!enabled) return Theme.disabledColor;
                if (up.pressed) return Theme.onHighlightColor;

                return Theme.onButtonColor;
            }
        }
    }
}
