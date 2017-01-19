//
//  UIColor+Style.swift
//  PushUps
//
//  Created by Andrew Walker on 06/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

internal extension UIColor {
    
    // MARK: - Internal Functions
    
    /**
     Transparent dark background color for content and controls.
     - returns: UIColor for content background.
     */
    internal static var darkBackground: UIColor {
        return UIColor(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 0.1)
    }
    
    /**
     Main application blue theme color.
     - returns: UIColor for backgrounds, buttons etc.
     */
    internal static var mainBlue: UIColor {
        return UIColor(red: 81.0 / 255.0, green: 212.2 / 255.0, blue: 242.0 / 255.0, alpha: 1.0)
    }
    
    /**
     Main application purple theme color.
     - returns: UIColor for backgrounds, buttons etc.
     */
    internal static var mainPurple: UIColor {
        return UIColor(red: 232.0 / 255.0, green: 81.0 / 255.0, blue: 242.0 / 255.0, alpha: 1.0)
    }
    
    /**
     
    */
    internal static var captureTypeYellow: UIColor {
        return UIColor(red: 255.0 / 255.0, green: 204.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)
    }
    
}
