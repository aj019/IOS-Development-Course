//
//  ViewController.swift
//  MovieList
//
//  Created by Anuj Gupta on 23/04/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire


struct movie {
    let image : UIImage!
    let title : String!
    let year : String!
}
class ViewController: UITableViewController {

    var search_url = "http://www.omdbapi.com/?s=a"
    
    var movies = [movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        callAlmo(url: search_url)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func callAlmo(url : String){
        
        Alamofire.request(url).responseJSON(completionHandler: {
            response in
            self.parseData(JSONData: response.data!)
        })
        
    }
    
    func parseData(JSONData : Data){
        
            let readableJSON = JSON(data: JSONData)
            
            let no = readableJSON["Search"].count
            print(no)
        for i in 0...no-1 {
            let jtitle = readableJSON["Search"][i]["Title"].string as String!
            let jyear = readableJSON["Search"][i]["Year"].string as String!
            
            let imageUrl = URL(string : readableJSON["Search"][i]["Poster"].string as String!)
            let mainImageData = NSData(contentsOf: imageUrl!)
            let mainImage = UIImage(data : mainImageData as Data!)
            
            movies.append(movie.init(image: mainImage, title: jtitle, year: jyear))
        }
        self.tableView.reloadData()
        print(movies)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let myMainImageView = cell.viewWithTag(3) as! UIImageView
        
        myMainImageView.image = movies[indexPath.row].image
        
        let titleLabel = cell.viewWithTag(1) as! UILabel
        
        titleLabel.text = movies[indexPath.row].title

        let yearLabel = cell.viewWithTag(2) as! UILabel
        
        yearLabel.text = movies[indexPath.row].year
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexPath = self.tableView.indexPathForSelectedRow?.row
        
        let vc = segue.destination as! MovieDetailsVC
        
        vc.image_movie = movies[indexPath!].image
        vc.name_movie = movies[indexPath!].title
        vc.year_movie = movies[indexPath!].year
        
        
    }

}

