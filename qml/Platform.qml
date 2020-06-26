
import QtQuick 2.2
import Felgo 3.0

 EntityBase {
   id: platform

   entityType: "Platform" // always name your entityTypes
   property int type: 0
   width: 64 // visual width of our platform
   height: 16 // visual height of our platform
   Image {
     id: platformImg
     source: if (gameWindow.theme === 0) {
                 "../assets/space/stone.png"
             } else if (gameWindow.theme === 1) {
                 "../assets/ice/stone.png"
             } else if (gameWindow.theme === 2) {
                 "../assets/snow/stone.png"
             } else if (gameWindow.theme === 3) {
                 "../assets/underwater/stone.png"
             }
     anchors.fill: platform
   }

   // BoxCollider responsible for collision detection
   BoxCollider {
     id: platformCollider
     width: parent.width-10 // actual width is the same as the parent entity
     height: parent.height -14 // actual height is slightly smaller so the collision works smoother
     bodyType: Body.Dynamic // only Dynamic bodies can collide with each other
     collisionTestingOnlyMode: true // collisions are detected, but no physics are applied to the colliding bodies
     fixture.onBeginContact: {
     var otherEntity1 = other.getBody().target
     var otherEntityType1 = otherEntity1.entityType

     if(otherEntityType1 === "Border") {
       platform.x = utils.generateRandomValueBetween(0, gameScene.width) // generate random x
       platform.y = 0 // the top of the screen
     }
   }
   }
    //platform movement
   MovementAnimation {
     id: movement
     target: platform
     property: "y"
     velocity:  jumper.impulse / 2 // impulse is y velocity of the jumper
     running: jumper.y < 210 // move only when the jumper is jumping high enough
   }

   MovementAnimation {
       id: movement1
       target: platform
       property: if (type === 1) {
                     "x"
                 } else if (type === 2) {
                     "y"
                 }

       velocity: 50
       running: type === 0 ? false : true
   }

   onYChanged: {
       if (y > gameScene.height) {
           if (type !== 0) {
               x= utils.generateRandomValueBetween(0, gameScene.width) // generate random x
               y= 0
           }
       }
   }

   onXChanged: {
           if (type === 1) {
               if (x < 0) {
                   x = gameScene.width
               }
               if (x > gameScene.width) {
                   x = 0
               }
           }
       }
 }
