//
//  MovieDetailsVC.swift
//  MovieList
//
//  Created by Anuj Gupta on 25/04/17.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailsVC: UIViewController {
    
    var image_movie = UIImage()
    var name_movie = String()
    var year_movie = String()
    
    
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var main_image: UIImageView!
    @IBOutlet weak var background_image: UIImageView!
    override func viewDidLoad() {
        
        background_image.image = image_movie
        main_image.image = image_movie
        name.text = name_movie
        year.text = year_movie
        
        
    }
    
    
    
}
