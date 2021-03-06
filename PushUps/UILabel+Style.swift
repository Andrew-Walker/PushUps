//
//  UILabel+Style.swift
//  PushUps
//
//  Created by Andrew Walker on 10/10/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

internal extension UILabel {
    
    // MARK: - Internal Functions
    
    /**
     Applys styling for set labels.
     */
    internal func applySetsStackViewStandardStyle() {
        self.textAlignment = .center
        self.font = UIFont.regularFont(ofSize: 24.0)
        self.textColor = UIColor.white
    }
    
    /**
     Applys styling for active set labels.
    */
    internal func applySetsStackViewActiveStyle() {
        self.textAlignment = .center
        self.font = UIFont.regularFont(ofSize: 24.0)
        self.textColor = UIColor.red
    }
    
}
