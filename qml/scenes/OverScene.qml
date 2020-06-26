import QtQuick 2.0
import Felgo 3.0
import "../"

// EMPTY SCENE

Scene {
    id: overScene

    signal gameAgainPressed
    signal menuScenePressed
    opacity: 0
    visible: opacity > 0
    enabled: visible


    Image {
        id: gamebackImage
        anchors.fill: overScene.gameWindowAnchorItem
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

    Image {
        id: overImage
        width: 200
        height: 60
        anchors.top: overScene.gameWindowAnchorItem.top
        anchors.topMargin: 30
        anchors.left: overScene.gameWindowAnchorItem.left
        anchors.leftMargin: 30
        source: "../../assets/race-over.png"
    }
    Text {
        id: socretext
        anchors.right: score.left
        anchors.leftMargin: 30
        anchors.bottom: end.top
        anchors.topMargin: 200
        text: "Scores:"
        font.pixelSize: 15
    }
    // Show score
    Text {
        id: score
        anchors.left: end.left
        anchors.leftMargin: 60
        anchors.bottom: end.top
        anchors.topMargin: 200
        text: gameScene.score
    }
    // Restart
    Image {
        id: end
        width: 110
        height: 40
        anchors.centerIn: overScene.gameWindowAnchorItem
        source: "../../assets/playagain.png"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                gameScene.score = 0  //Clear score
                gameAgainPressed()
            }
        }
    }
    //Back to menu
    Image {
        id: menu
        width: 110
        height: 40
        anchors.top: end.bottom
        anchors.topMargin: 30
        anchors.left: overScene.gameWindowAnchorItem.left
        anchors.leftMargin: 160
        source: "../../assets/menu.png"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                gameScene.score = 0
                menuScenePressed()
            }
        }
    }
}
