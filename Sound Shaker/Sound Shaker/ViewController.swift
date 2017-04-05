//
//  ViewController.swift
//  Sound Shaker
//
//  Created by Anuj Gupta on 05/04/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        

        
        if event?.subtype == UIEventSubtype.motionShake{
            
            let soundArray = ["1","2","3"]
            
            let rand = Int(arc4random_uniform(UInt32(soundArray.count)))
            
            let filelocation = Bundle.main.path(forResource: soundArray[rand], ofType: "mp3")
        
            do{
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: filelocation!))
                player.play()
            } catch{
                
            }
            
        }
    }


}

