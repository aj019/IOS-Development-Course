//
//  ViewController.swift
//  RememberMyNumber
//
//  Created by Anuj Gupta on 05/03/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBAction func btSave(_ sender: Any) {
        
        let str = textfield.text
        
        UserDefaults.standard.set(str, forKey: "number")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let strObject = UserDefaults.standard.object(forKey: "number")

        if let str = strObject as? String{
         
            textfield.isHidden = true
            button.isHidden = true
            label.text = str
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

