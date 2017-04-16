//
//  AudioVC.swift
//  Spotify
//
//  Created by Anuj Gupta on 16/04/17.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation


class AudioVC: UIViewController {
    
    var image = UIImage()
    var name = String()
    var mainPreviewUrl = String()
    
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var songName: UILabel!
    
    override func viewDidLoad() {
        
        songName.text = name
        mainImage.image = image
        backgroundImage.image = image
        
        downloadFilePlay(url: URL(string: mainPreviewUrl)!)
        
    playPauseButton.setTitle("Pause", for: .normal)
        
    }
    
    func downloadFilePlay(url : URL){
        
        var downloadTask = URLSessionDownloadTask()
        downloadTask = URLSession.shared.downloadTask(with: url, completionHandler: {
            customURL,response,error in
             self.play(url: customURL!)
        })
        
        downloadTask.resume()
        
    }
    
    func play(url : URL){
        
       
        do{
            
        try player = AVAudioPlayer(contentsOf: url)
        player.prepareToPlay()
        player.play()
            
        }catch{
            print(error)
        }
        
    }

    @IBAction func pausPlay(_ sender: Any) {
        
        if player.isPlaying {
            player.pause()
            playPauseButton.setTitle("Play", for: .normal)
        }else{
                player.play()
            playPauseButton.setTitle("Pause", for: .normal)
        }
        
    }
    
}
