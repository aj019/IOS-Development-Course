//
//  ViewController.swift
//  CatYears
//
//  Created by Anuj Gupta on 19/02/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBAction func Submit(_ sender: Any) {
        
        let age = Int(textField.text!)! * 7
        ageLabel.text = String(age)
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

