import QtQuick 2.0
 import Felgo 3.0
 import QtSensors 5.5
import QtMultimedia 5.0
 import "../"

 Scene {
   id: gameScene
   opacity: 0
   visible: opacity > 0
   enabled: visible
   signal menuScenePressed
   property int score: 0
   state: "start"
   width: 320
   height: 480
   Image {
     anchors.fill: parent.gameWindowAnchorItem
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
       id: scoreText
       width: gameScene.width
       height: 30
       x: 300
       y:0
       color: "red"
       text: score
   }

   Keys.forwardTo: jumper.controller

      Accelerometer {
        id: accelerometer
        active: true
      }

      // every platform gets recycled so we define only ten of them
       Repeater {
         model: 10
         Platform {
           x: utils.generateRandomValueBetween(0, gameScene.width) // random value
           y: gameScene.height /10* index // distribute the platforms across the screen
         }
       }
       Repeater {
         model: 1
         Platform {
           x: utils.generateRandomValueBetween(0, gameScene.width)
           y: gameScene.height /10* index // distribute the  Mobile platforms across the screen
           type: 1
         }
       }
       Repeater {
         model: 2
         Platform {
           x: utils.generateRandomValueBetween(0, gameScene.width)
           y: gameScene.height /10* index // distribute the  Mobile platforms across the screen
           type: 2
         }
       }
       Repeater{
           model:1
           Monster{
               x: utils.generateRandomValueBetween(0, gameScene.width)
               y: gameScene.height / 10* index // distribute the monster across the screen
           }
       }
       Repeater{
           model:1
           Stars{
               x: utils.generateRandomValueBetween(0, gameScene.width)
               y: gameScene.height / 10* index // distribute the stars across the screen

           }
       }
       Repeater{
           model:2
           BreakPlatform{
               x: utils.generateRandomValueBetween(0, gameScene.width)
               y: gameScene.height / 10* index // distribute the brokenplatform across the screen

           }
       }

       PhysicsWorld {
           debugDrawVisible: false// set this to true to show the physics overlay
           updatesPerSecondForPhysics: 60
           gravity.y: 20 // how much gravity do you want?
         }


      Jumper {
         id: jumper
         onOverScenePressed: {
             gameWindow.state = "over"
         } //Change the status of the main interface to "over"

         x: 0     //Set the initial position of the jumper
         y: 400
       }
      //Platform under jumper for the start
      Platform {
         id: platform
         x: 0
         y: 400

       }
      //Touch the stars that can add points
      Stars {
          id:stars
          x :100
          y:100
      }

      Border {
         id: border
         x: -gameScene.width * 2
         y: gameScene.height - 10 // subtract a small value to make the border just visible in your scene
       }
}
