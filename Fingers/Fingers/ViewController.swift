//
//  ViewController.swift
//  Fingers
//
//  Created by IT Amtek on 25/02/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    
    @IBOutlet weak var label: UILabel!
    @IBAction func btGuess(_ sender: Any) {
        
        let rand = arc4random_uniform(5)
        
        if textfield.text == String(rand){
        label.text = "You got it correct"
        }else{
            label.text = "Sorry the number was \(rand)"
        }
        
    }


}

