//
//  ViewController.swift
//  JumpRopeCounter
//
//  Created by Justin Pu on 2018/7/6.
//  Copyright © 2018 Justin Pu. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    
    private var count: Int = 0

    private var userDuringTraining: Bool = false
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBAction func startButtonDidPressed(_ sender: UIButton) {
        let title = userDuringTraining ? "Start" : "End"
        sender.setTitle(title, for: UIControlState.normal)
        userDuringTraining = !userDuringTraining
        
    }
    
    @IBAction func resetButtonDidPressed(_ sender: UIButton) {
        startButton.setTitle("Start", for: UIControlState.normal)
        userDuringTraining = false
        count = 0
        countLabel.text = "\(count)"
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            if userDuringTraining {
                count += 1
                countLabel.text = "\(count)"
            }
        }
    }
}

