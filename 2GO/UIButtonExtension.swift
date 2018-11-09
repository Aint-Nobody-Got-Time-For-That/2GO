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
