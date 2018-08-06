//
//  PushButton.swift
//  Flo
//
//  Created by pegasus on 2018/08/06.
//  Copyright © 2018年 Lo Chiwei. All rights reserved.
//

import UIKit
import Extensions

@IBDesignable
class PushButton: UIButton {
    
    // properties
    @IBInspectable var fillColor: UIColor = .green
    @IBInspectable var isAddButton: Bool = true

    override func draw(_ rect: CGRect) {
        
        // design details
        let w = rect.size.width // width of rect
        let h = rect.size.height    // height
        let r = w / 2 // radius
        let w2 = 1.414 * r   // width of dash
        let p = r - w2/2     // padding
        
        // key points
        let O = CGPoint(w/2, h/2)       // circle center
        let A1 = CGPoint(p, h/2)        // endpoints of horizontal segment
        let A2 = CGPoint(p + w2, h/2)
        let B1 = CGPoint(w/2, p)        // endpoints of vertical segment
        let B2 = CGPoint(w/2, p + w2)
        
        // circle
        UIBezierPath.circle(O, r, stroke: false, fillColor: fillColor)
        
        // plus
        UIBezierPath.segment(A1, A2, width: p, color: .white)
        if isAddButton {UIBezierPath.segment(B1, B2, width: p, color: .white)}
        
    }//end: draw()
 
}//end: UIButton
