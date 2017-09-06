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
    
    
    let filePath = "http://techslides.com/demos/sample-videos/small.mp4"
    let videoURL =  URL(string: "http://techslides.com/demos/sample-videos/small.mp4")!
    //var playerLayer: AVPlayerLayer?
    
    var playerItem:AVPlayerItem!
    var avplayer:AVPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        let txtField: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 500.00, height: 30.00))
        self.view.addSubview(txtField)
        self.view.bringSubview(toFront: txtField)
        //設定txtField
        
//        txtField.borderStyle = UITextBorderStyle.Line
//        txtField.text = "myString"
//        txtField.backgroundColor = UIColor.redColor()
        self.view.addSubview(txtField)

        //let videoURL = URL(fileURLWithPath: filePath)
        
        let player = AVPlayer(url: videoURL)
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        playerLayer.backgroundColor = UIColor.blue.cgColor
       
        
        self.view.layer.addSublayer(playerLayer)
        
        
        player.play()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

   
    
    
    
}
