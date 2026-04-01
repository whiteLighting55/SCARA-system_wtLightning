import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 800
    height: 500
    title: "Teach Pendant: White Lightning Edition v1.0.0"

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
                Text { text: "Estado: IDLE"; color:"white"}
                Text { text: "Conectando"; color:"lightgreen"}
                Text { text: "Modo manual"; color:"white"}
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

                Column{
                    anchors.centerIn: parent
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

        Rectangle{
            Layout.fillWidth: true
            height: 150
            color: "#2c2c2c"
            Row{
                anchors.centerIn: parent
                spacing: 50
                Column{
                    Text { text: "X";color: "#FFFFFF"}
                    Slider {from: -100;to:100}
                }
                Column{
                    Text { text: "Y";color: "#FFFFFF"}
                    Slider {from: -100;to:100}
                }
                Button{
                    text: "MOVE HERE"
                    onPressed: console.log("moving...\n")
                    onReleased: console.log("Stopped\n")
                }
            }
        }
    }
}
