//
//  UIApplication+Style.swift
//  PushUps
//
//  Created by Andrew Walker on 11/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

extension UIApplication {
    /**
     Applys global light status bar style.
     */
    static func applyGlobalStatusBarStyle() {
        self.shared().statusBarStyle = .lightContent
    }
}
