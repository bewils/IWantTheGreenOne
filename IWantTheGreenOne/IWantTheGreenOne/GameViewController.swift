//
//  GameViewController.swift
//  IWantTheGreenOne
//
//  Created by LRui on 2016/10/7.
//  Copyright © 2016年 lirui. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import CoreMotion

class GameViewController: UIViewController, UIAccelerometerDelegate {

    private var motionManager = CMMotionManager()
    private var speedX: UIAccelerationValue = 0
    private var speedY: UIAccelerationValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let skView = self.view as! SKView? {
            let gameScene = GameScene(size: self.view.frame.size)
            gameScene.scaleMode = .aspectFill
            
            skView.ignoresSiblingOrder = true
            skView.showsFPS = true
            skView.showsNodeCount = true
            skView.presentScene(gameScene)
        }
        
        motionManager.accelerometerUpdateInterval = 1 / 60
        if motionManager.isAccelerometerAvailable {
            let queue = OperationQueue.current
            motionManager.startAccelerometerUpdates(to: queue!, withHandler: { (data, error) -> Void in
                print(data)
            })
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
