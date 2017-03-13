//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by Anuj Gupta on 08/03/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webview: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
         * Loading web view with URL
         *
         */
//        
//        let url = NSURL (string: "https://www.google.co.in")
//        let requestObj = URLRequest(url: url! as URL)
//        //webview.loadRequest(requestObj)
//        webview.loadHTMLString("Hello", baseURL: nil)
        
        if let url = URL(string : "http://stackoverflow.com"){
            
            let request = NSMutableURLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest){
                data,response,error in
                
                if error != nil{
                    
                    print(error)
                    
                } else{
                    
                    if let unwrappedData = data {
                        
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        
                        self.webview.loadHTMLString(dataString as! String, baseURL: nil) 
                        
                        DispatchQueue.main.sync {
                            
                        }
                        
                    }
                    
                }
                
            }
            	
            task.resume()
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

