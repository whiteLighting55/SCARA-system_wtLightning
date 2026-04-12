import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {

    FontLoader {
        id: swish
        source: "qrc:/ScaraHMI/assets/fonts/SWISHBUT.TTF"
    }

    visible: true
    width: 800
    height: 500
    title: "Teach Pendant: White Lightning Edition v1.0.0"

    property string mode: "cartesian"

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        // 🔝 TOP BAR
        Rectangle {
            Layout.fillWidth: true
            height: 50
            color: "#2c2c2c"

            Row {
                anchors.centerIn: parent
                spacing: 20

                Text {
                    text: "Estado: " + (move_btn.pressed ? "MOVING" : "STOPPED")
                    color: move_btn.pressed ? "#00ff00" : "#ff0000"
                    font.bold: true
                }

                Text { text: "Conectando"; color: "lightgreen" }
                Text { text: "Modo: " + mode; color: "white" }
            }
        }

        // 🖥️ VIEWPORT SCARA (SIN BARRA LATERAL)
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#121212"

            Text {
                anchors.centerIn: parent
                text: "VISTA DEL SCARA"
                color: "#ffffff"
            }
        }

        // 🎮 CONTROL PANEL
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#2c2c2c"

            ColumnLayout {
                anchors.fill: parent
                spacing: 5

                // 🔘 SELECTOR
                Row {
                    spacing: 10

                    Button {
                        text: "Operacional"
                        checkable: true
                        checked: mode === "cartesian"
                        onClicked: mode = "cartesian"
                    }

                    Button {
                        text: "Joints"
                        checkable: true
                        checked: mode === "joints"
                        onClicked: mode = "joints"
                    }
                }

                // 🔄 UI DINÁMICA
                Loader {
                    id: loader
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    sourceComponent: mode === "cartesian" ? cartesianUI : jointsUI
                }

                // ▶️ BOTÓN
                Button {
                    id: move_btn
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50

                    background: Rectangle {
                        radius: 25
                        color: move_btn.pressed ? "#00bfff" : "#007acc"
                    }

                    contentItem: Text {
                        text: "(MOVE HERE)"
                        font.family: swish.name
                        font.pixelSize: 18
                        color: "#000000"
                        anchors.centerIn: parent
                    }
                }
            }

            // 🔵 CARTESIAN UI
            Component {
                id: cartesianUI

                Item {
                    anchors.fill: parent

                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 5

                        // X
                        RowLayout {
                            Layout.fillWidth: true
                            spacing: 10

                            Button {
                                Layout.minimumWidth: 40
                                Layout.maximumWidth: 40
                                Layout.fillHeight: true
                                text: "(<)"
                                onPressed: sliderX.value -= 1
                                font.family: swish.name
                            }

                            Text {
                                text: "X: " + sliderX.value.toFixed(1)
                                Layout.minimumWidth: 70
                                Layout.maximumWidth: 70
                                color: "#FF0000"
                            }

                            Slider {
                                id: sliderX
                                from: 0
                                to: 50
                                Layout.fillWidth: true
                            }

                            Button {
                                Layout.minimumWidth: 40
                                Layout.maximumWidth: 40
                                Layout.fillHeight: true
                                text: "(>)"
                                font.family: swish.name
                                onPressed: sliderX.value += 1
                            }
                        }

                        // Y
                        RowLayout {
                            Layout.fillWidth: true
                            spacing: 10

                            Button {
                                Layout.minimumWidth: 40
                                Layout.maximumWidth: 40
                                Layout.fillHeight: true
                                text: "(<)"
                                font.family: swish.name
                                onPressed: sliderY.value -= 1
                            }

                            Text {
                                text: "Y: " + sliderY.value.toFixed(1)
                                Layout.minimumWidth: 70
                                Layout.maximumWidth: 70
                                color: "#00FF00"
                            }

                            Slider {
                                id: sliderY
                                from: 0
                                to: 50
                                Layout.fillWidth: true
                            }

                            Button {
                                Layout.minimumWidth: 40
                                Layout.maximumWidth: 40
                                Layout.fillHeight: true
                                text: "(>)"
                                font.family: swish.name
                                onPressed: sliderY.value += 1
                            }
                        }

                        // Z
                        RowLayout {
                            Layout.fillWidth: true
                            spacing: 10

                            Button {
                                Layout.minimumWidth: 40
                                Layout.maximumWidth: 40
                                Layout.fillHeight: true
                                text: "(<)"
                                font.family: swish.name
                                onPressed: sliderZ.value -= 1
                            }

                            Text {
                                text: "Z: " + sliderZ.value.toFixed(1)
                                Layout.minimumWidth: 70
                                Layout.maximumWidth: 70
                                color: "#0000FF"
                            }

                            Slider {
                                id: sliderZ
                                from: 0
                                to: 50
                                Layout.fillWidth: true
                            }

                            Button {
                                Layout.minimumWidth: 40
                                Layout.maximumWidth: 40
                                Layout.fillHeight: true
                                text: "(>)"
                                font.family: swish.name
                                onPressed: sliderZ.value += 1
                            }
                        }
                    }
                }
            }

            // 🟡 JOINT UI
            Component {
                id: jointsUI

                Item {
                    anchors.fill: parent

                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 5

                        // Base
                        RowLayout {
                            Layout.fillWidth: true
                            spacing: 10

                            Button {
                                Layout.minimumWidth: 40
                                Layout.maximumWidth: 40
                                Layout.fillHeight: true
                                text: "(<)"
                                onPressed: sliderB.value -= 1
                                font.family: swish.name
                            }

                            Text {
                                text: "Base: " + sliderB.value.toFixed(1)
                                Layout.minimumWidth: 70
                                Layout.maximumWidth: 70
                                color: "#FF0000"
                            }

                            Slider {
                                id: sliderB
                                from: 0
                                to: 50
                                Layout.fillWidth: true
                            }

                            Button {
                                Layout.minimumWidth: 40
                                Layout.maximumWidth: 40
                                Layout.fillHeight: true
                                text: "(>)"
                                font.family: swish.name
                                onPressed: sliderB.value += 1
                            }
                        }

                        // Elbow
                        RowLayout {
                            Layout.fillWidth: true
                            spacing: 10

                            Button {
                                Layout.minimumWidth: 40
                                Layout.maximumWidth: 40
                                Layout.fillHeight: true
                                text: "(<)"
                                font.family: swish.name
                                onPressed: sliderE.value -= 1
                            }

                            Text {
                                text: "Elbow: " + sliderE.value.toFixed(1)
                                Layout.minimumWidth: 70
                                Layout.maximumWidth: 70
                                color: "#00FF00"
                            }

                            Slider {
                                id: sliderE
                                from: 0
                                to: 50
                                Layout.fillWidth: true
                            }

                            Button {
                                Layout.minimumWidth: 40
                                Layout.maximumWidth: 40
                                Layout.fillHeight: true
                                text: "(>)"
                                font.family: swish.name
                                onPressed: sliderE.value += 1
                            }
                        }

                        // Wrist
                        RowLayout {
                            Layout.fillWidth: true
                            spacing: 10

                            Button {
                                Layout.minimumWidth: 40
                                Layout.maximumWidth: 40
                                Layout.fillHeight: true
                                text: "(<)"
                                font.family: swish.name
                                onPressed: sliderW.value -= 1
                            }

                            Text {
                                text: "Wrist: " + sliderW.value.toFixed(1)
                                Layout.minimumWidth: 70
                                Layout.maximumWidth: 70
                                color: "#0000FF"
                            }

                            Slider {
                                id: sliderW
                                from: 0
                                to: 50
                                Layout.fillWidth: true
                            }

                            Button {
                                Layout.minimumWidth: 40
                                Layout.maximumWidth: 40
                                Layout.fillHeight: true
                                text: "(>)"
                                font.family: swish.name
                                onPressed: sliderW.value += 1
                            }
                        }
                    }
                }
            }
        }
    }
}
