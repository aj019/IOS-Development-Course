//
//  ViewController.swift
//  PermanentDataStorage
//
//  Created by Anuj Gupta on 05/03/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // This is how we save a string permanently
        //UserDefaults.standard.set("Rob", forKey: "name")
        
        // So the problem is that there might not be a key value pair for name 
        // We gotta check and then print
        
        
        let nameObject = UserDefaults.standard.object(forKey: "name")
        
        if let name = nameObject as? String{
            print(name)
        }
        
        // This is how we save an array permanently
        
        let arr = [1,2,5,3,4]
        
        UserDefaults.standard.set(arr, forKey: "Array")
        
        let arrObject = UserDefaults.standard.object(forKey: "Array")
        
        if let array = arrObject{
            print(array)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

