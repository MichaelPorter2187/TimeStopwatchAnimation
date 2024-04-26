//
//  DateViewController.swift
//  mporter_TimeStopWatchAnimation
//
//  Created by Michael Ray Porter, Jr on 4/25/24.
//

import UIKit

class DateViewController: UIViewController {
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var Time: UILabel!
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateT), userInfo: nil, repeats: true)
    }
  
    @objc func updateT(){
        
        let currentDate = NSDate()
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MMMM dd, yyyy"
        let convertedDateStr = dateFormat.string(from: currentDate as Date)
        Date.text = convertedDateStr
        
        dateFormat.dateFormat = "hh:mm:ss"
        let convertedTimeStr = dateFormat.string(from: currentDate as Date)
        Time.text = convertedTimeStr
        
    }

}
