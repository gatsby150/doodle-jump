import QtQuick 2.0
import Felgo 3.0

EntityBase {
    id:stars

    entityType: "Stars"
    width: 20
    height: 20
    Image {
      id: starsImg
      source: "../assets/stars.png"
      anchors.fill: stars
    }

    BoxCollider {
         id: starsCollider

         width: 20
         height: 20
         bodyType: Body.Dynamic
         sensor: true
         collisionTestingOnlyMode: true

         fixture.onBeginContact: {
         var otherEntity3 = other.getBody().target
         var otherEntityType3 = otherEntity3.entityType

         if(otherEntityType3 === "Border" ) {
           stars.x = utils.generateRandomValueBetween(0, gameScene.width) // generate random x
           stars.y = 0 // the top of the screen
         } else if (otherEntityType3 === "Jumper") {
             stars.visible = false
             score = score + 100
         }
         if(stars.visible === false) {
             stars.x = utils.generateRandomValueBetween(0, gameScene.width) // generate random x
             stars.y = 0 // the top of the screen
             stars.visible = true
         }
       }
  }

    MovementAnimation {
      id: movement2
      target: stars
      property: "y"
      velocity:  jumper.impulse / 2 // impulse is y velocity of the jumper
      running: jumper.y < 210
    }
}
