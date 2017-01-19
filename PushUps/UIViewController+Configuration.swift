//
//  UIViewController+Configuration.swift
//  PushUps
//
//  Created by Andrew Walker on 16/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal extension UIViewController {
    
    // MARK: - Internal Functions
    
    /**
     
    */
    internal func animateStatusBarTo(isHidden: Bool) {
        UIView.animate(withDuration: 0.2, animations: {
            UIApplication.shared.isStatusBarHidden = isHidden
        })
    }
    
}
