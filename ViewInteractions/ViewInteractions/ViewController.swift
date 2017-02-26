//
//  ViewController.swift
//  ViewInteractions
//
//  Created by Anuj Gupta on 19/02/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    @IBOutlet weak var label: UILabel!
//    
//    @IBOutlet weak var textfield: UITextField!
//    @IBAction func buttonTapped(_ sender: Any) {
//    
//        //label.text = "Hello world"
//        label.text = textfield.text
//    }
    @IBOutlet weak var NameLabel: UILabel!
    
    @IBOutlet weak var textfield: UITextField!
    
    @IBAction func submit(_ sender: Any) {
        
        NameLabel.text = textfield.text
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

