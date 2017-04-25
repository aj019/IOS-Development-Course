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
    
    var main_score = SKLabelNode()
    var enemy_score = SKLabelNode()
    
    var score = [Int]()
    
    
    override func didMove(to view: SKView) {
        
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        main = self.childNode(withName: "main") as! SKSpriteNode
        enemy = self.childNode(withName: "enemy") as! SKSpriteNode
        main_score = self.childNode(withName: "main_score") as! SKLabelNode
        enemy_score = self.childNode(withName: "enemy_score") as! SKLabelNode
        
        
        
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.friction = 1
        
        self.physicsBody = border
        
        startGame()

        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            
            let location = touch.location(in: self)
            
            if currentGameType == 0{
                
                if location.y > 0{
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }else{
                    main.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
                
            }else{
                main.run(SKAction.moveTo(x: location.x, duration: 0.2))

            }
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            
            let location = touch.location(in: self)
            
            if currentGameType == 0{
                
                if location.y > 0{
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }else{
                    main.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
                
            }else{
                main.run(SKAction.moveTo(x: location.x, duration: 0.2))
                
            }

        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        print(currentGameType)
        switch currentGameType {
        case 0 :
            break
            
        case 1:
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: 2.3))
            break;
            
        case 2:
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: 1.0))
            break
            
        case 3:
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.3))
            break;
        
        default:
            break
        }
        
        
        
        if ball.position.y <= main.position.y - 50{
            
            addScore(playerWhoWon: enemy)
            
            
        }else if ball.position.y >= enemy.position.y + 50 {
            
            addScore(playerWhoWon: main)
        }
        
        main_score.text = "\(score[0])"
        enemy_score.text = "\(score[1])"
        
    }
    
    func startGame(){
        score = [0,0]
        main_score.text = "\(score[0])"
        enemy_score.text = "\(score[1])"
        
        ball.physicsBody?.applyImpulse(CGVector(dx: -20, dy: -20))
    }
    
    func addScore(playerWhoWon : SKSpriteNode){
        
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        
        if playerWhoWon == main{
            score[0] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: -20, dy: -20))
        }else{
            score[1] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        }
        
    }
    
}
