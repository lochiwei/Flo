//
//  CounterView.swift
//  Flo
//
//  Created by pegasus on 2018/08/06.
//  Copyright © 2018年 Lo Chiwei. All rights reserved.
//

import UIKit
import Extensions

@IBDesignable
class CounterView: UIView {
    
    // constants
    private enum Constant {
        static let numberOfGlasses = 8
        static let lineWidth = CGFloat(5)
        static let arcWidth = CGFloat(76)
        static var lineHalfWidth: CGFloat { return lineWidth / 2 }
    }
    
    // inspectable variables
    @IBInspectable var counter: Int = 5
    @IBInspectable var outlineColor: UIColor = .black
    @IBInspectable var counterColor: UIColor = .orange
    
    // custom draw
    override func draw(_ rect: CGRect) {
        
        // design dimensions
        let (w, h) = (bounds.width, bounds.height)
        let O = bounds.center
        let r = max(w, h) / 2 - Constant.arcWidth / 2
        let a1 = pi * 0.75      // start angle
        let a2 = pi * 0.25      // end angle
        
        // 1. draw path        
        UIBezierPath.arc(center: O, radius: r, start: a1, end: a2, width: Constant.arcWidth, color: counterColor)
    }
    
}
