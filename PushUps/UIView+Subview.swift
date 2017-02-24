//
//  UIView+Subview.swift
//  PushUps
//
//  Created by Andrew Walker on 24/02/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal extension UIView {
    
    // MARK: - Internal Functions
    
    /**
     
     */
    internal func addDashedLine(color: UIColor) {
        let shapeLayer = CAShapeLayer()
        let position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        let point = CGPoint(x: self.frame.width, y: 0.0)
        
        shapeLayer.name = "DashedLine"
        shapeLayer.bounds = self.bounds
        shapeLayer.position = position
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 3.0
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineDashPattern = [4, 8]
        
        let path = CGMutablePath()
        path.move(to: .zero)
        path.addLine(to: point)
        shapeLayer.path = path
        
        self.layer.addSublayer(shapeLayer)
        self.backgroundColor = .clear
    }
    
}
