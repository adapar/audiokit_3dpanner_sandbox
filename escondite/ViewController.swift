//
//  ViewController.swift
//  escondite
//
//  Created by Andrés David Aparicio Alonso on 10/16/16.
//  Copyright © 2016 cerebro de plastilina. All rights reserved.
//

import UIKit
import AudioKit

class ViewController: UIViewController {

    var oscillator = AKOscillator()
    var panner: AK3DPanner?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        panner = AK3DPanner(oscillator, x: 0, y: 0, z: 0)
        AudioKit.output = panner
        AudioKit.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toggleSound(_sender: UIButton) {
        if oscillator.isPlaying {
            oscillator.stop()
            _sender.setTitle("Play Sine Wave", for: .normal)
        } else {
            oscillator.amplitude = 1//random(0.5, 1)
            oscillator.frequency = 440//random(220, 880)
            oscillator.start()
            _sender.setTitle("Stop Sine Wave at \(Int(oscillator.frequency))Hz", for: .normal)
        }
    }

}

