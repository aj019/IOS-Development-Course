//
//  GameScene.swift
//  PingPong
//
//  Created by Anuj Gupta on 20/04/17.
//  Copyright © 2017 test. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
   var ball = SKSpriteNode()
    var main = SKSpriteNode()
    var enemy = SKSpriteNode()
    
    
    override func didMove(to view: SKView) {
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        main = self.childNode(withName: "main") as! SKSpriteNode
        enemy = self.childNode(withName: "enemy") as! SKSpriteNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx: -20, dy: -20))
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.friction = 1
        
        self.physicsBody = border
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            
            let location = touch.location(in: self)
            
            main.run(SKAction.moveTo(x: location.x, duration: 0.2))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            
            let location = touch.location(in: self)
            
            main.run(SKAction.moveTo(x: location.x, duration: 0.2))
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.5))
        
    }
}
