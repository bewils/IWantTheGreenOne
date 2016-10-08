//
//  GameScene.swift
//  IWantTheGreenOne
//
//  Created by LRui on 2016/10/7.
//  Copyright © 2016年 lirui. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene {
    
    fileprivate var width: CGFloat { return self.size.width }
    fileprivate var height: CGFloat { return self.size.height }
    fileprivate var parentView: SKView { return self.view! }
    
    fileprivate var redBalls: [Ball] = [Ball]()
    fileprivate var greenBall: Ball?
    fileprivate var level: Int = 0
    fileprivate var startTime: TimeInterval = 0
    
    fileprivate var motionManager = CMMotionManager()
    fileprivate var speedX: UIAccelerationValue = 0
    fileprivate var speedY: UIAccelerationValue = 0
    
    convenience init(level: Int, size: CGSize) {
        self.init(size: size)
        self.level = level
        self.backgroundColor = UIColor.black
    }
    
    override func didMove(to view: SKView) {
        let entrance = SKSpriteNode(imageNamed: "entrance")
        entrance.position = CGPoint(x: width / 2, y: 40)
        entrance.zPosition = -1
        self.addChild(entrance)
        
        greenBall = Ball(type: .green)
        greenBall?.position = CGPoint(x: width / 2, y: height / 2 + 40)
        self.addChild(greenBall!)
        
        for i in 1...level {
            let redBall = Ball(type: .red)
            if i == 1 {
                redBall.position = CGPoint(x: width / 2, y: height / 2 - 40)
            } else {
                redBall.position = CGPoint(x: width / 5 * CGFloat(i - 1), y: height / 2 - 40)
            }
            redBalls.append(redBall)
            self.addChild(redBall)
        }
        
        /*
         It seems that CGPath must be closed...
         So I make the edge like this...
         The ball can still drop down the hole and the CGPath is closed
        ----------------------
        |                    |
        |                    |
        |                    |
        ---------    ---------
                |    |
                ——————
         */
        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: 0, y: 0),
                                CGPoint(x: 0, y: height),
                                CGPoint(x: width, y: height),
                                CGPoint(x: width, y: 0),
                                CGPoint(x: width / 2 + 45, y: 0),
                                CGPoint(x: width / 2 + 45, y: -100),
                                CGPoint(x: width / 2 - 45, y: -100),
                                CGPoint(x: width / 2 - 45, y: 0)])
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: path)
        self.physicsWorld.gravity = CGVector.zero
        
        initAnimation()
    }
    
    fileprivate func initAnimation() {
        for i in 1...3 {
            let numberNode = SKLabelNode(text: "\(4 - i)")
            numberNode.fontSize = 150
            numberNode.position = CGPoint(x: width / 2, y: height / 2)
            numberNode.isHidden = true
            numberNode.zPosition = 10
            self.addChild(numberNode)
            
            numberNode.run(SKAction.wait(forDuration: TimeInterval(i * 1)), completion: {
                numberNode.run(SKAction.sequence([SKAction.unhide(), SKAction.fadeOut(withDuration: 1)]), completion: { [weak self] in
                    if i == 3 {
                        self?.initLogic()
                    }
                })
            })
        }
    }
    
    fileprivate func initLogic() {
        let time = NSDate()
        startTime = time.timeIntervalSince1970
        
        motionManager.accelerometerUpdateInterval = 1 / 60
        if motionManager.isAccelerometerAvailable {
            let queue = OperationQueue.current
            motionManager.startAccelerometerUpdates(to: queue!, withHandler: { [weak self] (data, error) -> Void in
                if let data = data {
                    self?.physicsWorld.gravity = CGVector(dx: data.acceleration.y * 9.8, dy: data.acceleration.x * 9.8 * -2)
                }
            })
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        for redBall in redBalls {
            if redBall.position.y < CGFloat(-40) {
            }
        }
        
        if (greenBall?.position.y)! < CGFloat(-40) {
            let scoreScene = SKScene(fileNamed: "WinScene.sks") as! WinScene
            let time = Date()
            scoreScene.time = "\(Int(time.timeIntervalSince1970 - startTime))s"
            parentView.presentScene(scoreScene)
        }
    }
}
