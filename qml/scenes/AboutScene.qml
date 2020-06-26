import QtQuick 2.0
import Felgo 3.0
import "../"

Scene {
    id: aboutScene

    signal menuScenePressed
    opacity: 0
    visible: opacity > 0
    enabled: visible

    Image {
        id:aboutImage
      anchors.fill:
          aboutScene.gameWindowAnchorItem
      source: if (gameWindow.theme === 0) {
                  "../../assets/space/background.png"
              } else if (gameWindow.theme === 1) {
                  "../../assets/ice/background.png"
              } else if (gameWindow.theme === 2) {
                  "../../assets/snow/background.png"
              } else if (gameWindow.theme === 3) {
                  "../../assets/underwater/background.png"
              }
    }

    Text {
        id: authortext
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.left:parent.left
        anchors.leftMargin: 110
        text: "Authors:"
        font.pixelSize: 20
        color: "red"
    }

    Text {
        id :authortext2
        anchors.top: authortext.bottom
        anchors.topMargin: -20
        anchors.left: parent.left
        anchors.leftMargin: 40
        text: "
2018051604084 jinguotao
2018051604086 liuyi
2018051604088 tangruiyan"
        font.pixelSize: 20
        color: "red"
    }

    Text {
        id: introtext
        anchors.centerIn: parent
        text: "This is a jumping game.Players controls
the jumpers through the left and right
buttons. The jumpers will die when they
encountermonsters and the bottom border
of the game"
        font.pixelSize: 15
        color: "red"
    }

    Text {
        id: item
        anchors.top: parent.top
        anchors.topMargin: 140
        anchors.left:parent.left
        anchors.leftMargin: 67
        text: "Introduction"
        font.pixelSize: 35
        color: "red"
    }

    Image {
        id: menu
        width: 110
        height: 40
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30
        anchors.left:parent.left
        anchors.leftMargin: 105
        source: "../../assets/menu.png"
        MouseArea {
            anchors.fill: parent
            onClicked: menuScenePressed()
        }
    }
}

