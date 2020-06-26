import QtQuick 2.0
import Felgo 3.0
import QtMultimedia 5.0
import "scenes"

 EntityBase {
   id:jumper // the id we use as a reference inside this class
   width: 40
   height: 32
   poolingEnabled: true
   signal overScenePressed
   entityType: "Jumper" // always name your entityTypes

   state: jumperCollider.linearVelocity.y < 0 ?  "jumping" : "falling" // change state according to the jumper's y velocity
   property int impulse: y - jumperCollider.linearVelocity.y // to move platforms

      property alias controller: twoAxisController // we make the jumper's twoAxisController visible and accessible for the scene
      property double cx: 0  //Used to judge whether the character of jumper is facing left or right
      // jumperCollider uses TwoAxisController to move the jumper left or right.
      TwoAxisController {
        id: twoAxisController
      }

      Image {
          id: jumperImage
          source: if(gameWindow.theme ===0) {
                      if(jumper.state == "jumping") {
                        "../assets/space/jumper.png"
                       } else {
                        "../assets/space/jumpersit.png"
                      }

                  } else if (gameWindow.theme === 1) {
                      if(jumper.state == "jumping") {
                        "../assets/ice/jumper.png"
                       } else {
                        "../assets/ice/jumpersit.png"
                      }
                  } else if (gameWindow.theme === 2) {
                      if(jumper.state == "jumping") {
                        "../assets/snow/jumper.png"
                       } else {
                        "../assets/snow/jumper.png"
                      }
                  } else if (gameWindow.theme === 3) {
                      if(jumper.state == "jumping") {
                        "../assets/underwater/jumper.png"
                       } else {
                        "../assets/underwater/jumper.png"
                      }
                  }

          anchors.fill: parent
         mirror: true
      }

      Audio {
          id: dieSound
          source: "../assets/sound/die.mp3"
      }
      Audio {
          id: jumpSound
          source: "../assets/sound/jump.ogg"
      }

  BoxCollider {
       id: jumperCollider

       width: 25 // width of the frog collider
       height: 25// height of the frog collider

       bodyType: Body.Dynamic

       // handle collision
       fixture.onContactChanged: {
          var otherEntity = other.getBody().target
          var otherEntityType = otherEntity.entityType

          if(otherEntityType === "Border" || otherEntityType === "Monster") {
            jumper.die()
          }
          else if(otherEntityType === "Platform" && jumper.state == "falling") {
            jumperCollider.linearVelocity.y = -400
            jumpSound.play()
          }
        }
       // move the jumper left and right
       linearVelocity.x: system.desktopPlatform ?
                   twoAxisController.xAxis * 200 :  //  for desktop
                   (accelerometer.reading !== null ? -accelerometer.reading.x * 100 : 0)   // for mobile
        }
  // die and restart game
   function die() {
     // reset position
     jumper.x = 0
     jumper.y = 400
     platform.x = 0
     platform.y = 400
     // reset velocity
     jumperCollider.linearVelocity.y = 0
     overScenePressed() //Switch to gameover scene

     dieSound.play()
   }
   onYChanged: {
      if(y < 200) {
        y = 200 // limit the jumper's y value
          score += 1 // increase score
      }
    }
   onXChanged: {
       if (x < 0) {
           x = gameScene.width
       }
       if (x > gameScene.width) {
           x = 0
       }

       if(x - cx < 0) {
           jumperImage.mirror = false  //Move the jumper to the left, animation to the left
       }
       if(x - cx > 0) {
           jumperImage.mirror = true  //Move the jumper to the right, animation to the right
       }
       cx=x
   }
 }
