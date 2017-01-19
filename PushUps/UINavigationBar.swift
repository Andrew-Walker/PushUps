//
//  UINavigationBar.swift
//  PushUps
//
//  Created by Andrew Walker on 10/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

internal extension UINavigationBar {
    
    // MARK: - Internal Functions
    
    /**
     Applys global clear navigation bar style.
     */
    internal static func applyGlobalNavigationBarStyle() {
        self.appearance().setBackgroundImage(UIImage(), for: .default)
        self.appearance().shadowImage = UIImage()
        self.appearance().isTranslucent = true
        self.appearance().barStyle = .black
        self.appearance().tintColor = UIColor.white
    }
    
}
