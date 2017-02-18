//
//  UIScreen+Pushups.swift
//  PushUps
//
//  Created by Andrew Walker on 18/02/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal extension UIScreen {
    
    // MARK: - Internal Functions
    
    /**
     
     */
    internal static func isCompactHeight() -> Bool {
        return UIScreen.main.bounds.height <= 568.0
    }
    
    /**
     
     */
    internal static func isCompactWidth() -> Bool {
        return UIScreen.main.bounds.width <= 320.0
    }
    
}
