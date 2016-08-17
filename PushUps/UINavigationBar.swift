//
//  UINavigationBar.swift
//  PushUps
//
//  Created by Andrew Walker on 10/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

extension UINavigationBar {
    /**
     Applys global clear navigation bar style.
     */
    static func applyGlobalNavigationBarStyle() {
        self.appearance().setBackgroundImage(UIImage(), for: .default)
        self.appearance().shadowImage = UIImage()
        self.appearance().isTranslucent = true
    }
}
