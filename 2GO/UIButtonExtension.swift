//
//  UIButtonExtension.swift
//  2GO
//
//  Created by Alvin Lee on 11/8/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    // thank you Sean Allen www.youtube.com/watch?v=ox2MieJzcRQ&t=5s
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        layer.add(pulse, forKey: nil)
    }
    
    func flash() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.2
        flash.fromValue = 1
        flash.toValue = 0.3
        flash.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        flash.autoreverses = true
        layer.add(flash, forKey: nil)
    }
}
