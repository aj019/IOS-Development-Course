//
//  MenuVC.swift
//  PingPong
//
//  Created by Anuj Gupta on 21/04/17.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation
import UIKit

enum gameType : Int{
    case player2
    case easy
    case medium
    case hard
}

class MenuVC: UIViewController {
    
    
   
    @IBAction func Player(_ sender: Any) {
        
        moveToGame(game: 0)
    
    }
    
    @IBAction func easy(_ sender: Any) {
        moveToGame(game: 1)
    }
    
    @IBAction func medium(_ sender: Any) {
    
    moveToGame(game: 2)
    }
    
    @IBAction func hard(_ sender: Any) {
    
    moveToGame(game: 3)
        
    }
    
    func moveToGame(game : Int){
        
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "gameVC") as! GameViewController
        
        currentGameType = game
        
        
        self.navigationController?.pushViewController(gameVC, animated: true)
        
        
    }
    
    
}
