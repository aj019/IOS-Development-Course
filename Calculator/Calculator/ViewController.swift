//
//  ViewController.swift
//  Calculator
//
//  Created by Anuj Gupta on 17/12/17.
//  Copyright © 2017 Anuj Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var input1: UITextField!
    
    @IBOutlet weak var input2: UITextField!
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func ibAdd(_ sender: Any) {
        
        let a = Int(input1.text!)!
        let b = Int(input2.text!)!
        let res = a + b
        result.text = String(res)
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

