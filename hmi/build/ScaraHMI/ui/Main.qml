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
                    text: "Estado: " + (move_btn.pressed ? "moving" : "stopped").toUpperCase()
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

            //Left panel
            Rectangle {
                //Layout.preferredWith: 150
                Layout.fillHeight: true
                color: "#1f1f1f"

                ColumnLayout{
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    spacing: 15

                    Button{ text:"JOG"}
                    Button{ text:"PROGRAM"}
                    Button{ text: "MONITOR"}
                }
            }
            //Viewport
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
            height: 180
            color: "#2c2c2c"

            ColumnLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
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

                // 📦 CONTENIDO DINÁMICO
                Loader {
                    id: loader
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    sourceComponent: mode === "cartesian" ? cartesianUI : jointsUI
                }

                // 🎯 BOTÓN PRINCIPAL
                Button {
                    id: move_btn
                    Layout.alignment: Qt.AlignHCenter

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

                Row {
                    spacing: 30
                    Row {
                        Button {
                            text: "◀"
                            onPressed: sliderX.value -=1
                        }
                        Text {
                            text: ("X: " + sliderX.value.toFixed(1)).toUpperCase()
                            font.bold: true
                            color: "#FF0000"

                        }
                        Slider {
                            from: 0
                            to: 50
                            id: sliderX
                        }
                        Button {
                            text: "▶"
                            onPressed: sliderX.value +=1
                        }
                    }
                }
            }

            // 🟡 JOINT UI
            Component {
                id: jointsUI

                Row {
                    spacing: 30

                    Column {
                        Text { text: "base"; color: "white" }
                        Slider { from: -180; to: 180 }
                    }

                    Column {
                        Text { text: "Codo"; color: "white" }
                        Slider { from: -180; to: 180 }
                    }
                    Column {
                        Text { text: "Wrist"; color: "white" }
                        Slider { from: -180; to: 180 }
                    }
                }
            }
        }
    }
}

