//
//  ViewController.swift
//  MenuBars
//
//  Created by Anuj Gupta on 02/03/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    
    @IBAction func btCamera(_ sender: Any) {
        
        timer.invalidate()
        
    }
    
    func processTimer(){
        print("Asecond has passed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

