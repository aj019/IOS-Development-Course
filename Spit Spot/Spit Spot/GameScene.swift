//
//  GameScene.swift
//  Spit Spot
//
//  Created by Anuj Gupta on 26/04/17.
//  Copyright © 2017 test. All rights reserved.
//

import SpriteKit
import GameplayKit

struct physCategory {
    
    static let enemy :UInt32 = 0x1 << 0
    static let smallBall :UInt32 = 0x1 << 1
    static let mainBall :UInt32 = 0x1 << 2
    
    
}

class GameScene: SKScene,SKPhysicsContactDelegate {
    
    var mainBall = SKSpriteNode(imageNamed: "Ball")
    
    var timer = Timer()
    
    var hits = 0
    var gameStarted = false
    
    override func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate = self
    
        backgroundColor = UIColor.init(white: 1.0, alpha: 1.0)
        
        mainBall.size = CGSize(width: 225, height: 225)
        mainBall.position = CGPoint(x: 0, y: 0)
        mainBall.color = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        mainBall.colorBlendFactor = 1.0
        mainBall.zPosition = 1.0
        mainBall.physicsBody = SKPhysicsBody(circleOfRadius: mainBall.size.width/2)
        
        mainBall.physicsBody?.categoryBitMask = physCategory.mainBall
        mainBall.physicsBody?.collisionBitMask = physCategory.enemy
        mainBall.physicsBody?.contactTestBitMask = physCategory.enemy
        mainBall.name = "MainBall"
        mainBall.physicsBody?.isDynamic = false

        self.addChild(mainBall)
     
        
        //Enemies()
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA != nil && contact.bodyB != nil{
            let firstBody = contact.bodyA.node as! SKSpriteNode
            let secondBody = contact.bodyB.node as! SKSpriteNode
            
            if (firstBody.name == "SmallBall" && secondBody.name == "Enemy") {
                collisionBullet(enemy: secondBody, smallBall: firstBody)
                
            }else if (firstBody.name == "Enemy" && secondBody.name == "SmallBall"){
                
                collisionBullet(enemy: firstBody, smallBall: secondBody)
                
            }else if (firstBody.name == "MainBall" && secondBody.name == "Enemy"){
                print("hitA")
                collisionMain(enemy : secondBody)
                
            }else if (firstBody.name == "Enemy" && secondBody.name == "MainBall"){
                print("hitB")
                collisionMain(enemy : firstBody)
                
            }
        }
        
    }
    
    func collisionMain(enemy : SKSpriteNode) {
        
        if hits < 2 {
            
            mainBall.run(SKAction.scale(by: 1.5, duration: 0.4))
            enemy.physicsBody?.affectedByGravity = true
            enemy.removeAllActions()
            mainBall.run(SKAction.sequence([SKAction.colorize(with: UIColor.red, colorBlendFactor: 1.0, duration: 0.1),
                                            SKAction.colorize(with: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0), colorBlendFactor: 1.0, duration: 0.1)]))
            enemy.removeFromParent()
            hits += 1
        } else{
            enemy.removeFromParent()
            timer.invalidate()
            gameStarted = false
            
        }
        
        
    }
    
    func collisionBullet(enemy: SKSpriteNode,smallBall : SKSpriteNode) {
        
        enemy.physicsBody?.isDynamic = true
        enemy.physicsBody?.affectedByGravity = true
        
        enemy.physicsBody?.mass = 5.0
        smallBall.physicsBody?.mass = 5.0
    
        enemy.removeAllActions()
        enemy.physicsBody?.collisionBitMask = 0
        enemy.name = ""
        enemy.physicsBody?.contactTestBitMask = 0
        smallBall.removeAllActions()
        
    }
    
    func Enemies(){
        
        //print("entered")
        let enemies = SKSpriteNode(imageNamed: "Ball")
        enemies.size = CGSize(width: 30, height: 30)
        enemies.color = UIColor(red: 0.9, green: 0.1, blue: 0.1, alpha: 1.0)
        enemies.colorBlendFactor = 1.0
        enemies.zPosition = 0.0
        enemies.physicsBody = SKPhysicsBody(circleOfRadius: enemies.size.width/2)
        
        enemies.physicsBody?.categoryBitMask = physCategory.enemy
        enemies.physicsBody?.collisionBitMask = physCategory.smallBall
        enemies.physicsBody?.contactTestBitMask = physCategory.smallBall
        enemies.name = "Enemy"
        enemies.physicsBody?.isDynamic = true
        enemies.physicsBody?.affectedByGravity = false
        self.addChild(enemies)
        
        let rand4 = arc4random() % 4
        
        switch rand4 {
        case 0:
            
            enemies.position.x = -frame.size.width / 2
            
            let lower = -frame.size.height/2;
            let higher = frame.size.height/2;
            let positionY = Int(arc4random_uniform(UInt32(higher - lower + 1))) + Int(lower)
            enemies.position.y = CGFloat(positionY)
            break
            
        case 1:
            enemies.position.y = -frame.size.height / 2
            
            let lower = -frame.size.width/2;
            let higher = frame.size.width/2;
            let positionX = Int(arc4random_uniform(UInt32(higher - lower + 1))) + Int(lower)
            enemies.position.x = CGFloat(positionX)
            break
            
        case 2:
            enemies.position.x = frame.size.width / 2
            
            let lower = -frame.size.height/2;
            let higher = frame.size.height/2;
            let positionY = Int(arc4random_uniform(UInt32(higher - lower + 1))) + Int(lower)
            enemies.position.y = CGFloat(positionY)
            break
            
        case 3:
            enemies.position.y = frame.size.height / 2
            
            let lower = -frame.size.width/2;
            let higher = frame.size.width/2;
            let positionX = Int(arc4random_uniform(UInt32(higher - lower + 1))) + Int(lower)
            enemies.position.x = CGFloat(positionX)
            break
            
            default:
            break
        }
        
        enemies.run(SKAction.move(to: mainBall.position, duration: 3))
       
        
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        if !gameStarted{
            
            timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: Selector("Enemies"), userInfo: nil, repeats: true)
            gameStarted = true
            hits = 0
            mainBall.run(SKAction.scale(to: 0.44, duration: 0.2))
            
        }else{
    
        
        for t in touches {
            
            let location = t.location(in: self)
            //print(location)
            var smallBall = SKSpriteNode(imageNamed: "Ball")
            smallBall.position = mainBall.position
            smallBall.size = CGSize(width: 30, height: 30)
            smallBall.physicsBody = SKPhysicsBody(circleOfRadius: smallBall.size.width/2)
            smallBall.physicsBody?.affectedByGravity = true
            smallBall.color = UIColor(red: 0.1 , green: 0.65, blue: 0.95, alpha: 1.0)
            smallBall.colorBlendFactor = 1.0
            smallBall.zPosition = 0.0
            
            smallBall.physicsBody?.categoryBitMask = physCategory.smallBall
            smallBall.physicsBody?.collisionBitMask = physCategory.enemy
            smallBall.physicsBody?.contactTestBitMask = physCategory.enemy
            smallBall.name = "SmallBall"
            smallBall.physicsBody?.isDynamic = true
            smallBall.physicsBody?.affectedByGravity = true
            

            self.addChild(smallBall)

            var dx = CGFloat(location.x - mainBall.position.x)
            var dy = CGFloat(location.y - mainBall.position.y)
            
            let magnitude = sqrt(dx * dx + dy * dy)
            dx /= magnitude
            dy /= magnitude
            
            let vector = CGVector(dx: 30.0 * dx, dy: 30.0 * dy)
            smallBall.physicsBody?.applyImpulse(vector)
            
            }
            
        }
    }
    
      override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
