import QtQuick 2.0
import Felgo 3.0
import QtMultimedia 5.0
EntityBase {
  id:monster

  entityType: "Monster"
  width: 30
  height: 32
  Image {
    id: monsterImg
    source: if (gameWindow.theme === 0) {
                "../assets/space/monster.png"
            } else if (gameWindow.theme === 1) {
                "../assets/ice/monster.png"
            } else if (gameWindow.theme === 2) {
                "../assets/snow/monster.png"
            } else if (gameWindow.theme === 3) {
                "../assets/underwater/monster.png"
            }
    anchors.fill: monster
  }
  Audio {
      id: monSound
      source: "../assets/sound/monster.ogg"
  }


  BoxCollider {
       id: monsterCollider

       width: 30 // width of the jumper collider
       height: 32// height of the jumper collider

       bodyType: Body.Dynamic
       collisionTestingOnlyMode: true // collisions are detected, but no physics are applied to the colliding bodies
       fixture.onBeginContact: {
       var otherEntity2 = other.getBody().target
       var otherEntityType2 = otherEntity2.entityType

       if(otherEntityType2 === "Border") {
         monster.x = utils.generateRandomValueBetween(0, gameScene.width) // generate random x
         monster.y = 0 // the top of the screen
         monSound.play()
       }
     }
}

  MovementAnimation {
    id: movement1
    target: monster
    property: "y"
    velocity:  jumper.impulse / 2 // impulse is y velocity of the jumper
    running: jumper.y < 210 // move only when the jumper is jumping high enough
  }
}
