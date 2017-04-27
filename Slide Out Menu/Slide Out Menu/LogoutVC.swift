//
//  LogoutVC.swift
//  Slide Out Menu
//
//  Created by Anuj Gupta on 27/04/17.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation
import UIKit


class LogoutVC: UIViewController {
    
    @IBOutlet weak var open: UIBarButtonItem!
    override func viewDidLoad() {
        open.target = self.revealViewController()
        
        open.action = Selector("revealToggle:")
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())

    }
    
}
