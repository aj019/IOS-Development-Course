//
//  ViewController.swift
//  PassingData
//
//  Created by Anuj Gupta on 09/04/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var btSend: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func send(_ sender: Any) {
        
        // Check if value from myTextField is not empty
        if textField.text?.isEmpty == true
        {
            return
        }
        
        // Instantiate SecondViewController
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        // Set "Hello World" as a value to myStringValue
        secondViewController.myStringValue = textField.text
        
        // Take user to SecondViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
        
    }

}

