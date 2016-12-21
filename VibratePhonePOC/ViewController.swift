//
//  ViewController.swift
//  VibratePhonePOC
//
//  Created by Aditya Vikram Godawat on 09/12/16.
//  Copyright © 2016 Aditya Vikram Godawat. All rights reserved.
//

import UIKit
import AudioToolbox


class ViewController: UIViewController {
    
    var i = 0
    var timer = NSTimer()
    var timer1 = NSTimer()
    var label = UILabel()
    var j = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .redColor()
        let aVibrateButton = UIButton(frame: CGRect(x: 15, y: 15, width: view.frame.width-30, height: 45))
        aVibrateButton.setTitle("Vibrate Phone", forState: .Normal)
        aVibrateButton.addTarget(self, action: #selector(vibratePhone), forControlEvents: .TouchDown)
        view.addSubview(aVibrateButton)
        
        
        label.frame = CGRect(x: 0, y: 0, width: 166, height: 45)
        label.center = view.center
        label.text = "\(j)"
        view.addSubview(label)
    }
    
    
    func vibratePhone() {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(vibrate), userInfo: nil, repeats: true)
        timer1 = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(secProgress), userInfo: nil, repeats: true)
    }
    
    func vibrate() {
        i+=1
        if i > 15 {
            timer.invalidate()
            i=0
        } else {
            timer.fire()
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            
        }
    }
    
    
    func secProgress() {
        
        j-=1
        label.text = "\(j)"
        if j < 0 {
            j=5
            label.text = "\(j)"
            timer1.invalidate()
        } else {
            //            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            self.performSelector(#selector(buzz), withObject: self, afterDelay: 0)
        }
    }
    
    
    func buzz() {
        
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        
    }
    
}

