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

class GameViewController: UIViewController, UIAccelerometerDelegate {

    private var gameScene: GameScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let skView = self.view as! SKView? {
            skView.ignoresSiblingOrder = true
            skView.showsFPS = false
            skView.showsNodeCount = false
            skView.tag = 1
            
            gameScene = GameScene(level: skView.tag, size: self.view.frame.size)
            gameScene?.scaleMode = .aspectFill
            skView.presentScene(gameScene)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override var shouldAutorotate: Bool {
        return false
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
