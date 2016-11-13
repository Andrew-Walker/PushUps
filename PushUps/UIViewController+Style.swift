//
//  UIViewController+Style.swift
//  PushUps
//
//  Created by Andrew Walker on 06/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /**
     Applys background image to view and adds relevant constraints.
     */
    internal func applyBackground() {
        let image = UIImage(named: "background")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        self.view.insertSubview(imageView, at: 0)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0)
        let left = NSLayoutConstraint(item: imageView, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1.0, constant: 0)
        let right = NSLayoutConstraint(item: imageView, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1.0, constant: 0)
        
        NSLayoutConstraint.activate([top, bottom, left, right])
    }
    
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
