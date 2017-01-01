//
//  UIApplication+Style.swift
//  PushUps
//
//  Created by Andrew Walker on 11/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

internal extension UIApplication {
    
    /**
     Applys global light status bar style.
     */
    internal static func applyGlobalStatusBarStyle() {
        self.shared.statusBarStyle = .lightContent
    }
    
}
