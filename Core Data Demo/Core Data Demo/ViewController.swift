//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Anuj Gupta on 07/04/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        newUser.setValue("anuj", forKey: "name")
        newUser.setValue("anuj123", forKey: "password")
        newUser.setValue(23, forKey: "age")
        
        do{
            
            try context.save()
            print("Saved")
            
        } catch {
            
            print("error")
        }
        
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

