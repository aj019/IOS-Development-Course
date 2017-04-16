//
//  ViewController.swift
//  JSON
//
//  Created by Anuj Gupta on 15/04/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UITableViewController {

    var NumberOfRows = 0
    var namesArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        parseJson()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UITableViewCell

        if namesArray.count != 0 {
        
            cell.textLabel?.text = namesArray[indexPath.row]
            
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NumberOfRows
    }
    
    
    func parseJson(){
        
        let path : String = Bundle.main.path(forResource:"jsonFile",ofType:"json") as String!
        let jsonData = NSData(contentsOfFile: path) as NSData!
        
        let readableJSON = JSON(data: jsonData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers, error: nil)
        
        NumberOfRows = readableJSON["people"].count
        print(NumberOfRows)
        
        for i in 0...NumberOfRows-1 {
            
            var person = "person"
            person += "\(i+1)"
            var name = readableJSON["people"][person]["Name"].string as! String
            namesArray.append(name)
        }
        
        
    }
}

