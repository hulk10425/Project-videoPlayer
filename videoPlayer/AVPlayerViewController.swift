//
//  AVPlayerViewController.swift
//  videoPlayer
//
//  Created by 陳遵丞 on 2017/9/6.
//  Copyright © 2017年 hulk. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class AVPlayerViewController: UIViewController {
    
    //()
    let filePath = "http://techslides.com/demos/sample-videos/small.mp4"
    let videoURL =  URL(string: "http://techslides.com/demos/sample-videos/small.mp4")!
    let txtField = UITextField()
    //var playerLayer: AVPlayerLayer?
    let playbutton = UIButton(type: .system)
    let urlButton = UIButton(type: .system)
    
    
    
    var playerItem:AVPlayerItem!
    var avplayer:AVPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        txtField.frame = CGRect(x: 10, y: 20, width: self.view.frame.size.height - 30, height: 30)
        txtField.backgroundColor = UIColor.white
        txtField.text = "Enter URL of Video"
        
        self.view.addSubview(txtField)
        txtField.addObserver(self, forKeyPath: "changeURL", options: .old, context: nil)
       
        
        
        //設定playbtn
        
        playbutton.frame = CGRect(x: 20, y: self.view.frame.size.height - 31, width: 33, height: 19)
        playbutton.tintColor = UIColor.white
        playbutton.setTitle("Play", for: .normal)
        //playbutton.addTarget(self, action: "Action:", for: UIControlEvents.touchUpInside)
        self.view.addSubview(playbutton)
        
        //設定muteButton
        
        playbutton.frame = CGRect(x: 20, y: self.view.frame.size.height - 31, width: 33, height: 19)
        playbutton.tintColor = UIColor.white
        playbutton.setTitle("Play", for: .normal)
        //playbutton.addTarget(self, action: "Action:", for: UIControlEvents.touchUpInside)
        self.view.addSubview(playbutton)

        
        
        //設定txtField
        
//        txtField.borderStyle = UITextBorderStyle.Line
//        txtField.text = "myString"
//        txtField.backgroundColor = UIColor.redColor()
        self.view.addSubview(txtField)
        
        txtField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

        //let videoURL = URL(fileURLWithPath: filePath)
        
         avplayer = AVPlayer(url: videoURL)
        
        let playerLayer = AVPlayerLayer(player: avplayer)
        playerLayer.frame = self.view.bounds
        playerLayer.backgroundColor = UIColor.black.cgColor
       
        
        self.view.layer.addSublayer(playerLayer)
        
        self.view.bringSubview(toFront: urlButton)
        self.view.bringSubview(toFront: txtField)
        self.view.bringSubview(toFront: playbutton)
        //self.view.bringSubview(toFront: urlButton)
        
        avplayer.play()
        

        // Do any additional setup after loading the view.
    }
    
    
    func textFieldDidChange(_ textField: UITextField) {
        print("!!")
        print(textField.text!)
        let string = textField.text!
        
        let url = URL(string: string)
        guard url != nil else {
            return
        }
        
        DispatchQueue.main.async {
            
            self.avplayer = AVPlayer(url: url!)
            
            let playerLayer = AVPlayerLayer(player: self.avplayer)
            playerLayer.frame = self.view.bounds
             self.view.layer.addSublayer(playerLayer)

            // self.avplayer.seek(to: kCMTimeZero)
            self.avplayer.play()
        }
        
        //avplayer.pause()

        
        
        
        
        
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "changeURL" {
            
            print("!!")
        }
    }

    deinit{
        self.urlButton.removeObserver(self, forKeyPath: "changeURL")
        self.txtField.removeObserver(self, forKeyPath: "changeURL")
        
    }
    

   
    
    
    
}
