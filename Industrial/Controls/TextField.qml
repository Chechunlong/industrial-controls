import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.TextField {
    id: control

    property alias flat: background.flat
    property alias backgroundColor: background.color
    property alias isValid: background.isValid
    property alias labelText: background.text

    implicitWidth: background.implicitWidth
    implicitHeight: Math.max(background.textHeight + contentHeight + background.underline,
                             Theme.baseSize)
    font.pixelSize: Theme.mainFontSize
    color: control.enabled ? Theme.onContainerColor : Theme.disabledColor
    selectionColor: background.highlighterColor
    selectedTextColor: Theme.onSelectionColor
    selectByMouse: true
    leftPadding: Theme.padding
    bottomPadding: background.offset
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignBottom

    background: BackgroundInput {
        id: background
        anchors.fill: parent
        inputed: displayText.length > 0 || placeholderText.length > 0 || control.activeFocus
        highlighted: control.activeFocus
        clip: true
    }

    Label {
        id: placeholderLabel
        anchors.centerIn: parent
        visible: control.displayText.length == 0 && control.placeholderText.length > 0
        text: control.placeholderText
        font.pixelSize: Theme.mainFontSize
        color: Theme.onContainerColor
        opacity: 0.5
    }
}
