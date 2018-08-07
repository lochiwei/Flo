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
    
    // MARK: - Inspectables
    
    @IBInspectable var numberOfGlasses = 8
    
    // counter arc
    @IBInspectable var counter: Int = 5
    @IBInspectable var counterColor: UIColor = .orange
    @IBInspectable var counterWidth: CGFloat = 76
    
    // counter outline
    @IBInspectable var outlineColor: UIColor = .black
    @IBInspectable var outlineWidth: CGFloat = 5
    
    // MARK: - Design Details
    
    /// view's width and height
    var w: CGFloat { return bounds.width }
    var h: CGFloat { return bounds.height }
    /// counter arc's center
    var O: CGPoint { return bounds.center }
    /// radius for counter arc
    var r: CGFloat { return min(w, h)/2 - counterWidth/2 }
    /// start angle for counter arc
    let a1 = pi * 0.75
    /// end angle for counter arc
    let a2 = pi * 0.25
    
    // MARK: - Draw View
    
    // custom draw
    override func draw(_ rect: CGRect) {
        drawCounterArc()
        drawOutline()
    }//end: draw()
    
    func drawCounterArc() {
        
        
        
        // draw thick arc
        UIBezierPath.arc(center: O, radius: r, start: a1, end: a2, width: counterWidth, color: counterColor)
    }//end: drawCounterArc()
    
    func drawOutline() {
        
        // design outline path
        let a3 = CGFloat(a1 + pi * 1.5 * counter.realValue / numberOfGlasses.realValue)
        
        let outline = UIBezierPath(
            arcCenter: O,
            radius: r + counterWidth/2 - outlineWidth/2,
            startAngle: a1,
            endAngle: a3,
            clockwise: true
        )
        
        // Note: when stroked, isolated subpaths will be connected automatically
        outline.addArc(withCenter: O, radius: r - counterWidth/2 + outlineWidth/2, startAngle: a3, endAngle: a1, clockwise: false)
        
        outline.close()
        
        // draw outline
        outline.strokeOnly(width: outlineWidth, color: outlineColor)
    
    }//end: drawOutline
    
    public func update(with n:Int) {
        counter = n
        setNeedsDisplay()
    }
    
}//end: CounterView
