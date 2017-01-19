//
//  UIBarButtonItem+Style.swift
//  PushUps
//
//  Created by Andrew Walker on 16/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

internal extension UIBarButtonItem {
    
    // MARK: - Internal Functions
    
    /**
     Applys global white tint color style.
     */
    internal static func applyGlobalBarButtonStyle() {
        self.appearance().tintColor = UIColor.white
    }
    
}
