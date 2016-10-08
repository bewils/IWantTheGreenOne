//
//  ScoreScene.swift
//  IWantTheGreenOne
//
//  Created by LRui on 2016/10/8.
//  Copyright © 2016年 lirui. All rights reserved.
//

import SpriteKit

class WinScene: SKScene {
    var time: String?
    fileprivate var timeLabel: SKLabelNode?
    fileprivate var nextButton: SKLabelNode?
    fileprivate var parentView: SKView { return self.view! }
    
    override func didMove(to view: SKView) {
        timeLabel = self.childNode(withName: "//timeLabel") as! SKLabelNode?
        timeLabel?.text = time
        
        nextButton = self.childNode(withName: "//nextButton") as! SKLabelNode?
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let spriteNodes = nodes(at: location)
            for spriteNode in spriteNodes {
                if spriteNode.name == "nextButton" {
                    spriteNode.run(SKAction.hide())
                    
                    parentView.tag += 1
                    let gameScene = GameScene(level: parentView.tag, size: parentView.frame.size)
                    parentView.presentScene(gameScene)
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (nextButton?.isHidden)! {
            nextButton?.run(SKAction.unhide())
        }
    }
}
