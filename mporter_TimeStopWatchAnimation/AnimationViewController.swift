//
//  AnimationViewController.swift
//  mporter_TimeStopWatchAnimation
//
//  Created by Michael Ray Porter, Jr on 4/25/24.
//

import UIKit
import AVFoundation

class AnimationViewController: UIViewController {
    @IBOutlet weak var PictureView: UIImageView!
    var RRimages: [UIImage] = []
    var PBJimages: [UIImage] = []
    var buttonCount = 0
    var random = 1
    var backgroundMusic: AVAudioPlayer!
    var music = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 1...15{
            PBJimages.append(UIImage(named: "frame\(i).jpg")!)
        }
        
        for i in 0...9{
            RRimages.append(UIImage(named: "frame_00\(i)_delay-0.03s.jpg")!)
        }
        for i in 10...99{
            RRimages.append(UIImage(named: "frame_0\(i)_delay-0.03s.jpg")!)
        }
        for i in 100...158{
            RRimages.append(UIImage(named: "frame_\(i)_delay-0.03s.jpg")!)
        }
        PictureView.image = PBJimages[0]
        
    }
    
    @IBAction func PlayStop(_ sender: Any) {
        
        if PictureView.isAnimating{
            backgroundMusic.stop()
            PictureView.stopAnimating()
            PictureView.image = PBJimages[0]
        }else{
            buttonCount += 1
            
            if buttonCount % random == 0{
                PictureView.animationImages = RRimages
                PictureView.animationDuration = 4.5
                music = "RRLoop"
                buttonCount = 0
                random = Int.random(in: 1...10)
            }else{
                PictureView.animationImages = PBJimages
                PictureView.animationDuration = 1.25
                music = "Family Guy Peanut Butter Jelly Time"
            }
            if let backgroundMusicURL = Bundle.main.url(forResource: music, withExtension: "mp3"){
                backgroundMusic = try? AVAudioPlayer(contentsOf: backgroundMusicURL)
                backgroundMusic.numberOfLoops = -1
                backgroundMusic.play()
            }
            PictureView.startAnimating()
        }
    }
    
    
}
