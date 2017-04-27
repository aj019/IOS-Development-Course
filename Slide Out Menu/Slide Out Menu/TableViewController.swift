//
//  TableViewController.swift
//  Slide Out Menu
//
//  Created by Anuj Gupta on 27/04/17.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation
import UIKit


class TableViewController: UITableViewController {
    
    var tableArray = [String]()
    
    override func viewDidLoad() {
        
        tableArray = ["Home","Map","Settings","Logout"]
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableArray[indexPath.row])!

        cell.textLabel?.text = tableArray[indexPath.row]
        
        return cell
    }
    
}
