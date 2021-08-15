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
    
    let eggTimes = ["Soft" : 3, "Medium" : 4, "Hard" : 7]
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player : AVAudioPlayer!
    


    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        
        doneLabel.text = hardness
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target : self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        progressBar.progress = 0
        
        }
    
    @IBOutlet weak var doneLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    @objc func updateTimer(){
        
        let doneEggs = "Done!"
        
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            doneLabel.text = doneEggs
            playAlarm()
            }
        }
    
    func playAlarm() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    
    }

    

        
    
    
}



