//
//  StopwatchViewController.swift
//  mporter_TimeStopWatchAnimation
//
//  Created by Michael Ray Porter, Jr on 4/25/24.
//

import UIKit

class StopwatchViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startLabel: UIButton!
    @IBOutlet weak var stopLabel: UIButton!
    
    var myTimer = Timer()
    var startTime = TimeInterval()
    var running = false
    var resumeTime = TimeInterval()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timerLabel.text = "00:00:00"
    }
    
    @IBAction func Start(_ sender: Any) {
        if running == false{
            //timer starts running
            
            startTime = NSDate.timeIntervalSinceReferenceDate + resumeTime
            myTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateT), userInfo: nil, repeats: true)
            stopLabel.setTitle("Stop", for: .normal)
            //startLabel.setTitle("Resume", for: .normal)
            startLabel.isEnabled = false
        }else if running == true{
            //timer should resume
            
            //startTime = TimeInterval()
            //timerLabel.text = resume
            myTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateT), userInfo: nil, repeats: true)
        }
        running = !running
    }
    
    @IBAction func Stop(_ sender: Any) {
        if running == true{
            //timer should stop
            
            myTimer.invalidate()
            //resume = "banana"
            stopLabel.setTitle("Reset", for: .normal)
            //startLabel.setTitle("Resume", for: .normal)
            startLabel.isEnabled = true
        }else{
            //timer is reset
            
            timerLabel.text = "00:00:00"
            startLabel.setTitle("Start", for: .normal)
            stopLabel.setTitle("Stop", for: .normal)
        }
        running = false
    }
    
    @objc func updateT(){
        
        let currentTime = NSDate.timeIntervalSinceReferenceDate
        var passedTime: TimeInterval = currentTime - startTime
        
        let minutes = UInt8(passedTime / 60.0)
        passedTime = passedTime - TimeInterval(minutes)*60
        let seconds = UInt8(passedTime)
        passedTime = passedTime - TimeInterval(seconds)
        let milliseconds = UInt(passedTime*100)
        
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        let strMilliseconds = String(format: "%02d", milliseconds)
        timerLabel.text = "\(strMinutes):\(strSeconds):\(strMilliseconds)"
        
        
    }

}
