import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0

ColumnLayout {
    id: root

    spacing: 0

    TabBar {
        id: tabBar
        Layout.fillWidth: true
        Layout.rightMargin: controlSize.baseSize + controlSize.padding
        z: 1

        TabButton { text: "Buttons"; flat: true }
        TabButton { text: "Inputs"; flat: true }
        TabButton { text: "Switchs & Sliders"; flat: true }
    }

    StackLayout {
        currentIndex: tabBar.currentIndex
        Layout.fillWidth: true
        Layout.fillHeight: true

        Buttons {}
        Inputs {}
        SwitchsNSliders {}
    }
}
