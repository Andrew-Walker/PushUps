//
//  UIView+Animation.swift
//  PushUps
//
//  Created by Andrew Walker on 12/02/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal extension UIView {

    // MARK: - Internal Functions

    /**

     */
    internal func fadeIn(duration: TimeInterval = 0.2) {
        self.alpha = 0.0
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
        })
    }
}
