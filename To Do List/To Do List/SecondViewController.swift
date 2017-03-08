//
//  SecondViewController.swift
//  To Do List
//
//  Created by Anuj Gupta on 06/03/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    
    var arr = [String]()
    
    @IBAction func btAdd(_ sender: Any) {
        
        if let str = textfield.text{
            arr.append(str)
            textfield.text = ""
            UserDefaults.standard.set(arr, forKey: "items")
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

