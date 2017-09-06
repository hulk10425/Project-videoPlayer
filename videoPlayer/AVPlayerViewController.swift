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
    
    let videoURL =  URL(string: "1")!
    let txtField = UITextField()
    let playbutton = UIButton(type: .system)
    let muteButton = UIButton(type: .system)
    var playcounter = true
    var mutecounter = true

    var avplayer:AVPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        txtField.frame = CGRect(x: 10, y: 20, width: self.view.frame.size.width - 30, height: 30)
        txtField.backgroundColor = UIColor.white
        txtField.text = "Enter URL of Video"
        self.view.addSubview(txtField)
        txtField.addObserver(self, forKeyPath: "changeURL", options: .old, context: nil)
       
        
        
        //設定playbtn
        playbutton.frame = CGRect(x: 20, y: self.view.frame.size.height - 31, width: 40, height: 19)
        playbutton.tintColor = UIColor.white
        playbutton.setTitle("Play", for: .normal)
        playbutton.addTarget(self, action: #selector(playorstop), for: UIControlEvents.touchUpInside)
        self.view.addSubview(playbutton)
        
        //設定muteButton
        
        muteButton.frame = CGRect(x: self.view.frame.width - 53, y: self.view.frame.size.height - 31, width: 50, height: 19)
        muteButton.tintColor = UIColor.white
        muteButton.setTitle("Mute", for: .normal)
        muteButton.addTarget(self, action: #selector(muteorNot(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(muteButton)

        
        
        txtField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        avplayer = AVPlayer(url: videoURL)
        let playerLayer = AVPlayerLayer(player: avplayer)
        playerLayer.frame = self.view.bounds
        playerLayer.backgroundColor = UIColor.black.cgColor
       
        
        self.view.layer.addSublayer(playerLayer)
        self.view.bringSubview(toFront: muteButton)
        self.view.bringSubview(toFront: txtField)
        self.view.bringSubview(toFront: playbutton)
        
    }
    
    func playorstop(sender: UIButton){
        
        if playcounter {
            DispatchQueue.main.async {
                self.avplayer.pause()
                self.playcounter = false
            }
            self.playbutton.setTitle("Stop", for: .normal)
            return
        } else {
            DispatchQueue.main.async {
                self.avplayer.play()
                self.playcounter = true
            }
            self.playbutton.setTitle("Play", for: .normal)

            
        }
        
    }
    
    func muteorNot(sender: UIButton){
    
        if mutecounter {
            DispatchQueue.main.async {
                self.avplayer.isMuted = true
                self.mutecounter = false
            }
            self.muteButton.setTitle("Sound", for: .normal)
            return
        } else {
            
            DispatchQueue.main.async {
                self.avplayer.isMuted = false
                self.mutecounter = true
            }
            self.muteButton.setTitle("Mute", for: .normal)
        }
        
    }
    
    
    func textFieldDidChange(_ textField: UITextField) {
        
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

            self.avplayer.play()
        }
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "changeURL" {
            
            print("!!")
        }
    }

    deinit{
            self.txtField.removeObserver(self, forKeyPath: "changeURL")
        
    }

}
