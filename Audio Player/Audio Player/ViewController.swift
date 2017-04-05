//
//  ViewController.swift
//  Audio Player
//
//  Created by Anuj Gupta on 04/04/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player = AVAudioPlayer()
    
    @IBOutlet weak var slider: UISlider!
    @IBAction func btPlay(_ sender: Any) {
        
        player.play()
        
    }
    @IBAction func btPause(_ sender: Any) {
    
        player.pause()
    }
    @IBAction func Slide(_ sender: Any) {
    
        slider.minimumValue = 0.0
        slider.maximumValue = Float(player.duration)
        player.currentTime = TimeInterval(slider.value)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        slider.value = 0.0
        let audioPath = Bundle.main.path(forResource: "not", ofType: "mp3")
        do{
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            player.play()
            
        } catch{
            //Catch errors
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

