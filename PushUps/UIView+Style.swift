//
//  UIView+Style.swift
//  PushUps
//
//  Created by Andrew Walker on 04/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

extension UIView {
    /**
     Applys rounded corner radius calculated based on width or height.
     */
    func applyRoundCorners() {
        let width = self.frame.width
        let height = self.frame.height
        let useHeight = width > height
        self.layer.cornerRadius = (useHeight ? self.frame.height : self.frame.width) / 2
        self.layer.masksToBounds = true
    }
}
