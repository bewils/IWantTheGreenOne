//
//  Ball.swift
//  IWantTheGreenOne
//
//  Created by LRui on 2016/10/8.
//  Copyright © 2016年 lirui. All rights reserved.
//

import UIKit
import SpriteKit

class Ball: SKSpriteNode {
    
    convenience init(type: BallType) {
        switch type {
        case .red:
            self.init(imageNamed: "red")
        case .green:
            self.init(imageNamed: "green")
        }
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: 40)
        self.physicsBody?.restitution = 1.0
    }
}

enum BallType {
    case red
    case green
}
