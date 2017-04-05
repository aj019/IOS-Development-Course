//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Anuj Gupta on 17/03/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var status: UILabel!
    var player1 = 1
    var activeGame = true
    var gamestate = [0,0,0,0,0,0,0,0,0] // 0 -empty 1- nought 2-cross

    let winnin_comb = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[2,4,6],[0,4,8]]
    
    
    @IBAction func btReset(_ sender: Any) {
        
        
         player1 = 1
         activeGame = true
         gamestate = [0,0,0,0,0,0,0,0,0] // 0 -empty 1- nought 2-cross
        
        for i in 1..<10{
            if let button = view.viewWithTag(i) as? UIButton{
                button.setImage(nil, for: [])
            }
        }
        status.center = CGPoint(x:status.center.x - 500,y: status.center.y)
        
    }
    @IBAction func btMark(_ sender: AnyObject) {

        var active_pos = sender.tag - 1
        
        if gamestate[active_pos] == 0 && activeGame {
            if(player1 == 1){
                sender.setImage(UIImage(named: "nought.png"),for: [])
                gamestate[active_pos] = 1
                player1 = 2
            }else{
                sender.setImage(UIImage(named: "cross.png"),for: [])
                player1 = 1
                gamestate[active_pos] = 2
            }
        }
        
        for combination in winnin_comb{
            
            if gamestate[combination[0]] != 0 && gamestate[combination[1]] != 0 && gamestate[combination[2]] != 0{
                
                if gamestate[combination[0]] == gamestate[combination[1]] && gamestate[combination[1]] == gamestate[combination[2]] {
                    
                    if gamestate[combination[0]] == 1{
                        status.text = "0 wins"
                    }else{
                       status.text = "X wins"
                    }
                    
                    activeGame = false
                    UIView.animate(withDuration: 1, animations: {
                        
                        self.status.center = CGPoint(x:self.status.center.x + 500,y: self.status.center.y)
                    })
            
                }
                
            }
        }
        
        
        
        
        print(sender.tag)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        status.center = CGPoint(x:status.center.x - 500,y: status.center.y)
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

