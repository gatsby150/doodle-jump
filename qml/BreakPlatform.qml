import QtQuick 2.0
import VPlay 2.0
import QtMultimedia 5.5
import Felgo 3.0

EntityBase {
    id: breakPlatform
    entityType: "BreakPlatform"
    width: 42
    height: 12

    property int type

   SpriteSequence {
        id: platformSequence
        defaultSource: if (gameWindow.theme === 0) {
                           "../assets/space/source.png"
                       } else if (gameWindow.theme === 1) {
                           "../assets/ice/source.png"
                       } else if (gameWindow.theme === 2) {
                           "../assets/snow/source.png"
                       } else if (gameWindow.theme === 3) {
                           "../assets/underwater/source.png"
                       }
        anchors.fill: breakPlatform

        Sprite {
            name: "1"
            frameCount: 1
            frameY: 108
            frameWidth: 99
            frameHeight: 25
            frameRate: 0
        }
        Sprite {
            name: "2"
            frameCount: 1
            frameY: 135
            frameWidth: 99
            frameHeight: 30
            frameRate: 5
            to: {
                3: 2
            }
        }
        Sprite {
            name: "3"
            frameCount: 1
            frameY: 174
            frameWidth: 99
            frameHeight: 50
            frameRate: 5
            to: {
                4: 2
            }
        }
        Sprite {
            name: "4"
            frameCount: 1
            frameY: 225
            frameWidth: 99
            frameHeight: 65
            frameRate: 1
        }
    }

    BoxCollider {
        id: platformCollider
        anchors.fill: parent
        width: parent.width
        height: 10
        bodyType: Body.Dynamic // only Dynamic bodies can collide with each other
        collisionTestingOnlyMode: true

        fixture.onBeginContact: {
            var otherEntity4 = other.getBody().target
            var otherEntityType4 = otherEntity4.entityType

            if (otherEntityType4 === "Jumper" && jumper.state === "falling") {
                platformSequence.jumpTo("2")
                movement.running = true
                movement2.running = true
                breaksound.play()
            }
        }
    }
    MovementAnimation {
        id: movement
        target: breakPlatform
        property: "y"
        velocity: 100
    }
    MovementAnimation {
        id: movement1
        target: breakPlatform
        property: "y"
        velocity: jumper.impulse / 2
        running: jumper.y < 210
    }
    NumberAnimation {
        id: movement2
        target: platformSequence
        property: "opacity"
        to: 0
        duration: 1000
    }

    onYChanged: {
        if (y > gameScene.height) {
            x = utils.generateRandomValueBetween(0, gameScene.width)
            y = utils.generateRandomValueBetween(-parent.height, 10)
            platformSequence.jumpTo("1")
            movement.running = false
            platformSequence.opacity = 1
        }
    }
    Audio {
        id: breaksound
        source: "../assets/sound/platformbreak.mp3"
    }
}

