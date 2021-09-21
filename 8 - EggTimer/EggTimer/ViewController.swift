//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    let eggTimes = ["Soft" : 300, "Medium": 420, "Hard": 720]
    
    var secondsPassed: Float = 0
    var secondsRemaining: Float = 10
    
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        secondsPassed = 0
        secondsRemaining = Float(eggTimes[hardness]!)
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        
        if secondsPassed < secondsRemaining {
            print("\(secondsPassed) seconds.")
            secondsPassed += 1
            progressView.progress = secondsPassed/secondsRemaining
        } else {
            timer.invalidate()
            playSound()
            titleLabel.text = "Done!"
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}
