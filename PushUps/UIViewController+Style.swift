//
//  UIViewController+Style.swift
//  PushUps
//
//  Created by Andrew Walker on 06/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

internal extension UIViewController {
    
    // MARK: - Internal Functions
    
    /**
     Applys background gradient to view.
     */
    internal func applyBackgroundGradient() {
        let viewFrame = self.view.frame
        let heightOffset: CGFloat = 114.0
        
        let topColor = UIColor.clear.cgColor
        let bottomColor = UIColor.black.withAlphaComponent(0.75).cgColor
        
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0.0, y: heightOffset, width: viewFrame.width, height: viewFrame.height - heightOffset)
        gradient.colors = [topColor, bottomColor]
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
}
