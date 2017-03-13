//
//  ViewController.swift
//  Whats The Weather
//
//  Created by Anuj Gupta on 12/03/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var resultLabel1: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    @IBAction func btSubmit(_ sender: Any) {
        
        
        if var city = cityTextField.text{
        
            if city == ""{
                
                resultLabel.text = "Please enter something"
                
            }else{
                
            
            city = city.replacingOccurrences(of: " ", with: "-")
            if let url = URL(string : "http://www.weather-forecast.com/locations/"+city+"/forecasts/latest"){
            
            let request = NSMutableURLRequest(url : url)
            
            let task = URLSession.shared.dataTask(with:request as URLRequest){
                data,response,error in
                
                var message = ""
                if error != nil{
                    print(error)
                }else{
                    if let unwrappedData = data {
                        
                        let dataString = NSString(data: unwrappedData,encoding: String.Encoding.utf8.rawValue)
                        //print(dataString)
                        
                        let stringSeperator = "<span class=\"read-more-content\"> <span class=\"phrase\">"
                        
                        if let componentArray = dataString?.components(separatedBy: stringSeperator){
                            
                            let stringSeperator2 = "</span>"
                            
                            let newComponentArray = componentArray[1].components(separatedBy: stringSeperator2)
                            if newComponentArray.count > 1{
                                
                                message = newComponentArray[0].replacingOccurrences(of: "&deg;", with: "°")
                            }
                            
                            
                        }
                        
                    }
                    
                }
                
                if message == ""{
                    message = "The weather couldn't be found"
                }
                
                DispatchQueue.main.sync(execute: {
                    self.resultLabel.text = message
                })
            }
            
            task.resume()
            
            }else{
                resultLabel.text = "The City name is not correct"
            }
        
            }
            
        }else{
            
            resultLabel.text = "Please enter city name"
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resultLabel.text = "Hello"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }


}

