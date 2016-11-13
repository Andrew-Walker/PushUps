//
//  UILabel+Style.swift
//  PushUps
//
//  Created by Andrew Walker on 10/10/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

extension UILabel {
    
    /**
     Applys styling to label when required for displaying sets in a stack view.
     */
    internal func applySetsStackViewStandardStyle() {
        self.textAlignment = .center
        self.font = UIFont.systemFont(ofSize: 24.0)
        self.textColor = UIColor.white
    }
    
    /**
     
    */
    internal func applySetsStackViewActiveStyle() {
        self.textAlignment = .center
        self.font = UIFont.systemFont(ofSize: 24.0)
        self.textColor = UIColor.red
    }
    
}
