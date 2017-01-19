//
//  UIColor+Adjustment.swift
//  PushUps
//
//  Created by Andrew Walker on 10/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

internal extension UIColor {
    
    // MARK: - Internal Functions
    
    /**
     Adjusts values of colour based on a delta ammount.
     - parameters:
        - red: CGFloat value for Red.
        - green: CGFloat value for Green.
        - blue: CGFloat value for Blue.
        - alpha: CGFloat value for Alpha.
     - returns: Colour with adjusted values based on given delta.
     */
    internal func adjust(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        return UIColor(red: r + red, green: g + green, blue: b + blue, alpha: a + alpha)
    }
    
}
