//
//  ViewController.swift
//  PrimeOrNot
//
//  Created by Anuj Gupta on 02/03/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textfield: UITextField!
    @IBAction func btCheck(_ sender: Any) {
        
        var num = Int(textfield.text!)
        var isPrime = true
        for i in stride(from: 2, to: num! - 1, by: 1){
            
            if num! % i == 0 {
                isPrime = false
                break
            }else{
                isPrime = true
            }
            
        }
        
        if isPrime {
            label.text = "Prime"
        }else{
            label.text = "Not Prime"
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

