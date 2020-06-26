import QtQuick 2.0
import Felgo 3.0
import "../"

Scene {
    id: menuScene
    width: 320
    height: 480
    signal gameScenePressed
    signal settingScenePresed
    signal aboutScenePressed
    signal achievementPressed
    opacity: 0
    visible: opacity > 0
    enabled: visible

    Image {
        id:menuImage
      anchors.fill:
          menuScene.gameWindowAnchorItem
      source: if (gameWindow.theme === 0) {
                  "../../assets/space/background.png"
              } else if (gameWindow.theme === 1) {
                  "../../assets/ice/background.png"
              } else if (gameWindow.theme === 2) {
                  "../../assets/snow/background.png"
              } else if (gameWindow.theme === 3) {
                  "../../assets/underwater/background.png"
              }


      Image {
          id: tatle
          anchors.left: parent.left
          anchors.top: parent.top
          anchors.topMargin: 80
          rotation: -20
          source: "../../assets/doodle-jump.png"
      }
      Image {
        id: playing
        source: "../../assets/play.png"
        anchors.centerIn: parent
        MouseArea {
          id: gameSceneMouseArea
          anchors.fill: parent
          onClicked: gameScenePressed()
        }
      }
      Image {
        id: achievement
        width: 150
        height: 60
        source: "../../assets/achievement.png"
        anchors.left: parent.left
        anchors.top: parent.top
        MouseArea {
          id: achievementMouseArea
          anchors.fill: parent
          onClicked: achievementPressed()
        }
      }
      Image {
          id: setting
          width: 57
          height: 48
          anchors.top: playing.bottom
          anchors.left: playing.left
          anchors.leftMargin: 150
          anchors.topMargin: 150
          source: "../../assets/options.png"

          MouseArea {
              anchors.fill: parent
              onClicked: settingScenePresed()
          }
      }
      Image {
          id: about
          width: 20
          height: 20
          anchors.top:parent.top
          anchors.right:parent.right
          anchors.rightMargin: 10
          anchors.topMargin: 10
          source: "../../assets/redhelp.png"

          MouseArea{
              anchors.fill: parent
              onClicked: aboutScenePressed()
          }
      }
      //Set the initial position of the jumper
      Jumper {
          id: jumper
          x: 30
          y: 200
      }
       //Platform under jumper for the menu
      Platform {
          id: floor
          x: 30
          y: 400
      }
    }

}
