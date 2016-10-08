//
//  GameScene.swift
//  IWantTheGreenOne
//
//  Created by LRui on 2016/10/7.
//  Copyright © 2016年 lirui. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var node: SKNode?
    var actualGravity: CGVector {
        get {
            return self.physicsWorld.gravity
        }
        set {
            print(newValue)
            self.physicsWorld.gravity = newValue
        }
    }
    
    override func didMove(to view: SKView) {
        let redNode = SKSpriteNode(imageNamed: "red")
        redNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
        redNode.physicsBody = SKPhysicsBody(circleOfRadius: 40)
        self.addChild(redNode)
        
        let greenNode = SKSpriteNode(imageNamed: "green")
        greenNode.position = CGPoint(x: size.width / 2 - 200, y: size.height / 2)
        greenNode.physicsBody = SKPhysicsBody(circleOfRadius: 40)
        self.addChild(greenNode)
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
//        self.physicsWorld.gravity = CGVector(dx: 10, dy: 0)
        print(self.physicsWorld.gravity)
    }
}
