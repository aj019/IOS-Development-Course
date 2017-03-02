//
//  ViewController.swift
//  EggTimerApp
//
//  Created by Anuj Gupta on 03/03/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    // Label to display time remaining
    @IBOutlet weak var timerLabel: UILabel!
    
    
    // Function to handle pause button click event
    @IBAction func btPause(_ sender: Any) {
        
        timer.invalidate()
    }
    
    // Function to handle pause button click event
    @IBAction func btPlay(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector("processTimer"), userInfo: nil, repeats: true)

    
    }
    
    @IBAction func btAdd10(_ sender: Any) {
        var num = Int(timerLabel.text!)
        num! = num! + 10
        timerLabel.text = String(num!)
        
    }
    
    @IBAction func btReset(_ sender: Any) {
    timerLabel.text = "210"
    }
   
    @IBAction func btSubtract10(_ sender: Any) {
        var num = Int(timerLabel.text!)
        num! = num! - 10
        timerLabel.text = String(num!)
        
    }
    
    func processTimer(){
        var num = Int(timerLabel.text!)
        num! = num! - 1
        timerLabel.text = String(num!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

