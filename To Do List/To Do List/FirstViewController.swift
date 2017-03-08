//
//  FirstViewController.swift
//  To Do List
//
//  Created by Anuj Gupta on 06/03/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    var arr = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let arrayObject = UserDefaults.standard.object(forKey: "items")

        if arr = arrayObject as! [String]{
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return arr.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        var cell = UITableViewCell(style: UITableViewCellStyle.default,reuseIdentifier : "Cell")
        
        
        cell.textLabel?.text = "Anuj"
        
        return cell
        
    }


}

