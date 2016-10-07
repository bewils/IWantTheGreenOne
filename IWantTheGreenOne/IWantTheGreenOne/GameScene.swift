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
    
    override func didMove(to view: SKView) {
        let redNode = SKSpriteNode(imageNamed: "red")
        redNode.setScale(0.2)
        redNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
        redNode.physicsBody = SKPhysicsBody(circleOfRadius: 40)
        self.addChild(redNode)
        
        let greenNode = SKSpriteNode(imageNamed: "green")
        greenNode.setScale(0.2)
        greenNode.position = CGPoint(x: size.width / 2 - 200, y: size.height / 2)
        greenNode.physicsBody = SKPhysicsBody(circleOfRadius: 80)
        self.addChild(greenNode)
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
    }
}
