import Felgo 3.0
import QtQuick 2.0
import "scenes"

GameWindow{
    id:gameWindow
    screenWidth: 640
    screenHeight: 960

    activeScene: gameScene
    property int theme: 0

    EntityManager {
      id: entityManager
      entityContainer: gameScene
    }

    GameScene {
      id: gameScene
      onMenuScenePressed: {
        gameWindow.state = "menu"
      }
    }

    MenuScene {
      id: menuScene
      onGameScenePressed: {
        gameWindow.state = "game"
      }
      onSettingScenePresed: {
          gameWindow.state = "set"
      }
      onAboutScenePressed: {
          gameWindow.state = "about"
      }
      onAchievementPressed: {
          gameWindow.state="felgo"
       }
    }

    SettingScene {
        id: settingScene
        onGameScenePressed: {
            gameWindow.state ="menu"
        }
    }

    AboutScene{
        id:aboutScene
        onMenuScenePressed: {
            gameWindow.state = "menu"
        }
    }

    OverScene{
        id: overScene
        onGameAgainPressed: {
            gameWindow.state = "game"
        }
        onMenuScenePressed: {
            gameWindow.state = "menu"
        }
    }
        FelgoNetWorkScene{
        id:felgonetworkscene


        }
        FelgoGameNetwork {
          id: gameNetwork
          // created in the Felgo Web Dashboard
          gameId: 5
          secret: "abcdefg1234567890"
          gameNetworkView: myGameNetworkView
        }


    state: "menu"
    //Game state
    states: [
      State {
        name: "menu"
        PropertyChanges {target: menuScene; opacity: 1}
        PropertyChanges {target: gameWindow; activeScene: menuScene}
      },
        State {
          name: "over"
          PropertyChanges {target: overScene; opacity: 1}
          PropertyChanges {target: gameWindow; activeScene: overScene}
        },
        State {
          name: "set"
          PropertyChanges {target: settingScene; opacity: 1}
          PropertyChanges {target: gameWindow; activeScene: settingScene}
        },
        State {
          name: "about"
          PropertyChanges {target: aboutScene; opacity: 1}
          PropertyChanges {target: gameWindow; activeScene: aboutScene}
        },
      State {
        name: "game"
        PropertyChanges {target: gameScene; opacity: 1}
        PropertyChanges {target: gameWindow; activeScene: gameScene}
      },
        State {
          name: "felgo"
          PropertyChanges {target: felgonetworkscene; opacity: 1}
          PropertyChanges {target: gameWindow; activeScene: felgonetworkscene}
        }
    ]
}
