//
//  UIVIewController+PushUps.swift
//  PushUps
//
//  Created by Andrew Walker on 20/11/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

internal extension UIViewController {
    
    // MARK: - Internal Functions
    
    /**
     Dismisses self and any parent view controllers presented modally.
    */
    internal func dismissToRoot() {
        var viewController = self.presentingViewController
        while let presentingViewController = viewController?.presentingViewController {
            viewController = presentingViewController
        }
        viewController?.dismiss(animated: true)
    }
    
}
