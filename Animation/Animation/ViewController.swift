//
//  ViewController.swift
//  Animation
//
//  Created by Anuj Gupta on 15/03/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    var counter = 1
    var isAnimating = false
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    func animate() {
        image.image = UIImage(named:"frame_\(counter)_delay-0.15s.gif")
        
        counter += 1
        
        if counter == 6 {
            counter = 0
        }

        
    }
    @IBAction func btNext(_ sender: Any) {
        
        if isAnimating{
            
            isAnimating = false
            button.setTitle("Start Animation", for: [])
            timer.invalidate()
            
        }
        else{
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
        
            isAnimating = true
            button.setTitle("Stop Animation", for: [])
            
        }
        
    }
    @IBAction func btFadeIn(_ sender: Any) {
        
        image.alpha = 0
        
        UIView.animate(withDuration: 1) { 
            self.image.alpha = 1
        }
        
    }
    @IBAction func btSlideIn(_ sender: Any) {
        
        image.center = CGPoint(x: image.center.x - 500,y: image.center.y )
        
        UIView.animate(withDuration: 1) { 
            self.image.center = CGPoint(x:self.image.center.x + 500,y:self.image.center.y )
        }
        
    }
    @IBAction func btGrow(_ sender: Any) {
        
        image.frame = CGRect(x:0,y:0,width:0,height:0)
        
        UIView.animate(withDuration: 2) { 
            
            self.image.frame = CGRect(x:0,y:0,width:200,height:200)
            
        }
        
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

