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

    //variables a usar
    property string mode:"cartesian"

    ColumnLayout{
        anchors.fill: parent

        //Top Bar of the HMI
        Rectangle {
            Layout.fillWidth: true
            height: 50
            color: "#2c2c2c"

            Row{
                anchors.centerIn: parent
                spacing: 20

                Text {
                    text: "Estado: " + (move_btn.pressed ? "MOVING" : "STOPPED")
                    color: (move_btn.pressed ? "#00ff00" : "#ff0000")
                    font.bold: true
                }

                Text { text: "Conectando"; color:"lightgreen"}
                Text { text: "Modo: " + mode; color:"white"}
            }
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true

            Rectangle {
                Layout.fillHeight: true
                width: 80
                color: "#1f1f1f"
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "#121212"

                Text {
                    anchors.centerIn: parent
                    text: "VISTA DEL SCARA"
                    color:"#ffffff"
                }
            }
        }

        //control panel
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight : true
            color: "#2c2c2c"

            ColumnLayout {
                anchors.fill: parent
                spacing: 10

                // 🔘 SELECTOR DE MODO
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


                Loader {
                    id: loader
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    sourceComponent: mode === "cartesian" ? cartesianUI : jointsUI
                }

                // Boton de "move here"
                Button {
                    id: move_btn
                    Layout.fillWidth: true

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
                Item{
                    Layout.fillWidth: true
                    //Sliders de los ejes
                    ColumnLayout{
                        Layout.fillWidth: true

                        //X slider
                        RowLayout{
                            Layout.fillWidth: true
                            spacing: 20

                            Button {
                                contentItem: Text{
                                    text: "(<)"
                                    font.family: swish.name
                                    color: "#FFFFFF"
                                }
                                onPressed: sliderX.value -= 1
                                background: Rectangle{
                                    color: "#686868"
                                    radius: 50
                                }
                            }

                            Text {
                                text: "X: " + sliderX.value.toFixed(1)
                                font.bold: true
                                color: "#FF0000"
                            }

                            Slider {
                                id: sliderX
                                from: 0
                                to: 50
                                Layout.fillWidth: true
                            }

                            Button {
                                contentItem: Text{
                                    text: "(>)"
                                    font.family: swish.name
                                    color: "#FFFFFF"
                                }
                                onPressed: sliderX.value += 1
                                background: Rectangle{
                                    color: "#686868"
                                    radius: 50
                                }
                            }
                        }
                        //Y slider
                        RowLayout {
                            Layout.fillWidth: true
                            spacing: 20

                            Button {
                                contentItem: Text{
                                    text: "(<)"
                                    font.family: swish.name
                                    color: "#FFFFFF"
                                }
                                onPressed: sliderY.value -= 1
                                background: Rectangle{
                                    color: "#686868"
                                    radius: 50
                                }
                            }

                            Text {
                                text: "Y: " + sliderY.value.toFixed(1)
                                font.bold: true
                                color: "#00FF00"
                            }

                            Slider {
                                id: sliderY
                                from: 0
                                to: 50
                                Layout.fillWidth: true
                            }

                            Button {
                                contentItem: Text{
                                    text: "(>)"
                                    font.family: swish.name
                                    color: "#FFFFFF"
                                }
                                onPressed: sliderY.value += 1
                                background: Rectangle{
                                    color: "#686868"
                                    radius: 50
                                }
                            }
                        }
                        //Z slider
                        RowLayout {
                            Layout.fillWidth: true
                            spacing: 20

                            Button {
                                contentItem: Text{
                                    text: "(<)"
                                    font.family: swish.name
                                    color: "#FFFFFF"
                                }
                                onPressed: sliderZ.value -= 1
                                background: Rectangle{
                                    color: "#686868"
                                    radius: 50
                                }
                            }

                            Text {
                                text: "Z: " + sliderZ.value.toFixed(1)
                                font.bold: true
                                color: "#0000FF"
                            }

                            Slider {
                                id: sliderZ
                                from: 0
                                to: 50
                                Layout.fillWidth: true
                            }

                            Button {
                                contentItem: Text{
                                    text: "(>)"
                                    font.family: swish.name
                                    color: "#FFFFFF"
                                }
                                onPressed: sliderZ.value += 1
                                background: Rectangle{
                                    color: "#686868"
                                    radius: 50
                                }
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

                    Row {
                        anchors.centerIn: parent
                        spacing: 30

                        Column {
                            Text { text: "BASE"; color: "white" }
                            Slider { from: -180; to: 180; width: 100 }
                        }

                        Column {
                            Text { text: "CODO"; color: "white" }
                            Slider { from: -180; to: 180; width: 100 }
                        }

                        Column {
                            Text { text: "WRIST"; color: "white" }
                            Slider { from: -180; to: 180; width: 100 }
                        }
                    }
                }
            }
        }
    }
}
