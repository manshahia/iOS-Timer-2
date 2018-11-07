//
//  ViewController.swift
//  Timer
//
//  Created by Ravi Inder Manshahia on 07/11/18.
//  Copyright © 2018 Ravi Inder Manshahia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

 
    
    //MARK: Outlet & Variables
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var timer = Timer()
    
    var time = 220
    
    //MARK: System boilerplate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: IBActions
    @IBAction func pausePressed(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func playPressed(_ sender: Any) {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true)
        {
            timer in
            self.updateTime(time: -1 )
            
            
            print("Timer countdown \(self.time)")
            
            if self.time == 0
            {
                self.timer.invalidate()
            }
        }
    }
    
    @IBAction func addTenSeconds(_ sender: Any) {
        updateTime(time: 10)
    }
    
    
    @IBAction func removeTenSeconds(_ sender: Any) {
        updateTime(time: -10)
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        
        timer.invalidate()
        resetTime(time: 220)
        
    }

    //MARK: Utility Functions
    func updateTimeLabel() {
        self.timerLabel.text = String(self.time)
    }
    func updateTime(time : Int) {
        self.time = self.time + time
        updateTimeLabel()
    }
    func resetTime(time : Int)
    {
        self.time = time
        updateTimeLabel()
    }

}

