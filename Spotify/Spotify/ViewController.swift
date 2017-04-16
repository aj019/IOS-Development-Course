//
//  ViewController.swift
//  Spotify
//
//  Created by Anuj Gupta on 16/04/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit
import Alamofire
import AVFoundation

var player = AVAudioPlayer()

struct post {
    let image : UIImage!
    let name : String!
    let previewURL :String!
}

class ViewController: UITableViewController,UISearchBarDelegate {

    var searchUrl = String()
    typealias JSONStandard = [String : AnyObject]
    var posts = [post]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let keywords = searchBar.text
        let finalKeywords = keywords?.replacingOccurrences(of: " ", with: "+")
        
        searchUrl = "https://api.spotify.com/v1/search?q=\(finalKeywords!)&type=track"
        callAlmo(url: searchUrl)
        self.view.endEditing(true)
        posts.removeAll()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
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
                if let items = tracks["items"] as? [JSONStandard]{
                    for i in 0..<items.count{
                        let item = items[i]
                        let name = item["name"] as! String
                        let preview_url = item["preview_url"] as! String
                        
                        if let album = item["album"]{
                            if let images = album["images"] as? [JSONStandard] {
                                let imageData = images[0]
                                let imageUrl = URL(string : imageData["url"] as! String)
                                let mainImageData = NSData(contentsOf: imageUrl!)
                                
                                let mainImage = UIImage(data : mainImageData as! Data)
                                posts.append(post.init(image: mainImage, name: name,previewURL: preview_url))
                                self.tableView.reloadData()

                            }
                        }
                        
                    }
                    
                    
                }
            }
        }
        catch{
            print(error)
        }
        
        
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let myMainImageView = cell.viewWithTag(1) as! UIImageView
        
        myMainImageView.image = posts[indexPath.row].image
        
        let myMainLabel = cell.viewWithTag(2) as! UILabel
        
        myMainLabel.text = posts[indexPath.row].name
        
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = self.tableView.indexPathForSelectedRow?.row
        
        let vc = segue.destination as! AudioVC
        vc.image = posts[indexPath!].image
        vc.name = posts[indexPath!].name
        vc.mainPreviewUrl = posts[indexPath!].previewURL
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

