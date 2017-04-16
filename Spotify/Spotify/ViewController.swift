//
//  ViewController.swift
//  Spotify
//
//  Created by Anuj Gupta on 16/04/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UITableViewController {

    var searchUrl = "https://api.spotify.com/v1/search?q=Shawn&type=track"
    typealias JSONStandard = [String : AnyObject]
    var namesArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        callAlmo(url: searchUrl)
    }
    
    func callAlmo(url : String){
        
        Alamofire.request(url).responseJSON(completionHandler: {
            response in
            self.parseData(JSONData: response.data!)
            
        
        })
        
        
        
    }
    
    func parseData(JSONData : Data){
        
        do{
            var readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as! JSONStandard
            print(readableJSON)
            if let tracks = readableJSON["tracks"] as? JSONStandard {
                if let items = tracks["items"]{
                    for i in 0..<items.count{
                        let item = items[i] as! JSONStandard
                        let name = item["name"] as! String
                        namesArray.append(name)
                    }
                    
                    self.tableView.reloadData()
                    
                }
            }
        }
        catch{
            print(error)
        }
        
        
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = namesArray[indexPath.row]
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

