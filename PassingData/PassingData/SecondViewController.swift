//
//  SecondViewController.swift
//  PassingData
//
//  Created by Anuj Gupta on 09/04/17.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    var myStringValue:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // We will simply print out the value here
        print("The value of myStringValue is: \(myStringValue!)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
