//
//  ViewController.swift
//  hw13task
//
//  Created by admin on 2/25/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var player: AVAudioPlayer?
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var carBody: UIImageView!
    @IBOutlet weak var tireOne: UIImageView!
    @IBOutlet weak var tireTwo: UIImageView!
    
    var currentRotation: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func brakePedal(_ sender: Any) {
        currentRotation += .pi
        UIView.animate(withDuration: 3) {
            self.playSound()
            self.background.layer.frame = CGRect(x: 0, y: 0, width: 1222, height: 896)
            self.tireOne.transform = CGAffineTransform(rotationAngle: self.currentRotation / -1)
            self.tireTwo.transform = CGAffineTransform(rotationAngle: self.currentRotation / -1)
        }
    }
    
    @IBAction func gazPedal(_ sender: Any) {
        currentRotation += .pi
        UIView.animate(withDuration: 3) {
            self.playSound()
            self.background.layer.frame = CGRect(x: -808, y: 0, width: 1222, height: 896)
            self.tireOne.transform = CGAffineTransform(rotationAngle: self.currentRotation)
            self.tireTwo.transform = CGAffineTransform(rotationAngle: self.currentRotation)
        }
    }

    func playSound() {
        guard let url = Bundle.main.url(forResource: "RACECAR", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}

