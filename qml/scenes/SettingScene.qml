import QtQuick 2.0
import Felgo 3.0
import "../"

// EMPTY SCENE

Scene {
    id: settingScene
    opacity: 0
    visible: opacity > 0
    enabled: visible

signal gameScenePressed
    //apace theme
    Rectangle {
        id: th1
        x:0
        y:0
        width: 320
        height: 120

        Image {
            id: theme1
            anchors.fill: parent
            source: "../../assets/space/theme.png"

            MouseArea{
                anchors.fill: parent
                onClicked:{
                gameWindow.theme = 0
                gameScenePressed()
                }
            }
        }
    }
    //ice theme
    Rectangle {
        id: th2
        x:0
        y:120
        width: 320
        height: 120

        Image {
            id: theme2
            anchors.fill: parent
            source: "../../assets/ice/theme.png"

            MouseArea{
                anchors.fill: parent
                onClicked:{
                gameWindow.theme = 1
                gameScenePressed()
                }
            }
        }
    }
       //snow theme
       Rectangle {
            id: th3
            x:0
            y:240
            width: 320
            height: 120

            Image {
                id: theme3
                anchors.fill: parent
                source:  "../../assets/snow/theme.png"

                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                    gameWindow.theme = 2
                    gameScenePressed()
                    }
                }

            }
    }
       //underwater theme
       Rectangle {
           id: th4
           x:0
           y:360
           width: 320
           height: 120

           Image {
               id: theme4
               anchors.fill: parent
               source: "../../assets/underwater/theme.png"

               MouseArea{
                   anchors.fill: parent
                   onClicked:{
                   gameWindow.theme = 3
                   gameScenePressed()
                   }
               }
           }
       }
}
