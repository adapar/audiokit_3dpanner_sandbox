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

    var currentX = 0.0
    var currentY = 0.0
    var currentZ = 0.0
    
    var oscillator = AKOscillator()
    var panner: AK3DPanner?
    
    @IBOutlet weak var sliderX: UISlider!
    @IBOutlet weak var labelX: UILabel!
    
    @IBOutlet weak var sliderY: UISlider!
    @IBOutlet weak var labelY: UILabel!
    
    @IBOutlet weak var sliderZ: UISlider!
    @IBOutlet weak var labelZ: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        panner = AK3DPanner(oscillator, x: currentX, y: currentY, z: currentZ)
        
        AudioKit.output = panner
        AudioKit.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func updateX(_ sender: AnyObject) {
        currentX = Double(sliderX.value)
        panner?.x = currentX
        labelX.text = String.localizedStringWithFormat("%.1f", currentX)
    }
    
    @IBAction func updateY(_ sender: AnyObject) {
        currentY = Double(sliderY.value)
        panner?.y = currentY
        labelY.text = String.localizedStringWithFormat("%.1f", currentY)
    }
    
    @IBAction func updateZ(_ sender: AnyObject) {
        currentZ = Double(sliderZ.value)
        panner?.z = currentZ
        labelZ.text = String.localizedStringWithFormat("%.1f", currentZ)
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

