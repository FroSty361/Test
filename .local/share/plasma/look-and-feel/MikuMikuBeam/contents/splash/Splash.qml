/*
 *   Copyright 2014 Marco Martin <mart@kde.org>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License version 2,
 *   or (at your option) any later version, as published by the Free
 *   Software Foundation
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 2.5
import QtQuick.Window 2.2

Rectangle {
    id: root
    color: "#000000"

    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true;
        } else if (stage == 5) {
            introAnimation.target = busyIndicator;
            introAnimation.from = 1;
            introAnimation.to = 0;
            introAnimation.running = true;
        }
    }

    Item {
        id: content
        anchors.fill: parent
        opacity: 0
        TextMetrics {
            id: units
            text: "M"
            property int gridUnit: boundingRect.height
            property int largeSpacing: units.gridUnit
            property int smallSpacing: Math.max(2, gridUnit/4)
        }

        Rectangle {

        property int sizeAnim: 2200

        id: imageSource
        width:  sizeAnim
        height: sizeAnim
        color:  "transparent"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        clip: true;

 				Image {
            id: bg
            //in the middle of the remaining space
            anchors.horizontalCenter: parent.horizontalCenter
							anchors.verticalCenter: parent.verticalCenter
            anchors.margins: units.gridUnit
            source: "images/bg.png"
            sourceSize.height: units.gridUnit * 120
            sourceSize.width: units.gridUnit * 120
							smooth: true
            visible: true 
        }

        AnimatedImage { 
            id: face
            source: "images/plasma_d.gif"
            paused: false 
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width:  996
            height: 392
            smooth: true
            visible: true 
         }
    }

       Image {
            id: busyIndicator
            //in the middle of the remaining space
            y: parent.height - 150
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: units.gridUnit
            source: "images/39.png"
            sourceSize.height: units.gridUnit * 4
            sourceSize.width: units.gridUnit * 4
            RotationAnimator on rotation {
                id: rotationAnimator
                from: 0
                to: 360
                duration: 1500
                loops: Animation.Infinite
            }
        }
				Image {
            id: glowTop
            //in the middle of the remaining space
            y: parent.height - 910
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: units.gridUnit
            source: "images/glow.png"
            sourceSize.height: units.gridUnit * 70
            sourceSize.width: units.gridUnit * 70
							smooth: true
            visible: true 
        }
				Image {
            id: glowBottom
            //in the middle of the remaining space
            y: parent.height - 545
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: units.gridUnit
            source: "images/glow.png"
            sourceSize.height: units.gridUnit * 100
            sourceSize.width: units.gridUnit * 100
							smooth: true
            visible: true 
        }
				Image {
            id: topRightMiku
							x: 1350
            y: parent.height - 890
            //anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: units.gridUnit
            source: "images/happymiku.png"
            sourceSize.height: units.gridUnit * 10
            sourceSize.width: units.gridUnit * 10
							smooth: true
            visible: true 
        }


				//________________stars_____________________\\

				Image {
            id: star0
							x: 350
            y: 600
            anchors.margins: units.gridUnit
            source: "images/star.png"
							transform: Rotation { origin.x: 0; origin.y: 0; angle: 0}
            sourceSize.height: units.gridUnit * 10
            sourceSize.width: units.gridUnit * 10
							smooth: true
            visible: true 
        }
					
				Image {
            id: star1
							x: 850
            y: 290
            anchors.margins: units.gridUnit
            source: "images/starpink.png"
							transform: Rotation { origin.x: 0; origin.y: 0; angle: 400}
            sourceSize.height: units.gridUnit * 5
            sourceSize.width: units.gridUnit * 5
							smooth: true
            visible: true 
        }


				Image {
            id: star2
							x: 1300
            y: 730
            anchors.margins: units.gridUnit
            source: "images/star.png"
							transform: Rotation { origin.x: 0; origin.y: 0; angle: -400}
            sourceSize.height: units.gridUnit * 12
            sourceSize.width: units.gridUnit * 12
							smooth: true
            visible: true 
        }

				Image {
            id: star3
							x: 1420
            y: 650
            anchors.margins: units.gridUnit
            source: "images/starpink.png"
							transform: Rotation { origin.x: 0; origin.y: 0; angle: -100}
            sourceSize.height: units.gridUnit * 5
            sourceSize.width: units.gridUnit * 5
							smooth: true
            visible: true 
        }
				
    }

    OpacityAnimator {
        id: introAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.InOutQuad
    }
}
