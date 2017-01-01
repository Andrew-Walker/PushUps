//
//  ConstraintHelper.swift
//  PushUps
//
//  Created by Andrew Walker on 01/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal final class ConstraintHelper {
    
    // MARK: - Internal Functions
    
    internal static func applyTopConstraint(subview: UIView, constant: CGFloat, superview: UIView) {
        let top = superview.topAnchor.constraint(equalTo: subview.topAnchor, constant: -constant)
        superview.addConstraint(top)
    }
    
    internal static func applyBottomConstraint(subview: UIView, constant: CGFloat, superview: UIView) {
        let bottom = superview.bottomAnchor.constraint(equalTo: subview.bottomAnchor, constant: constant)
        superview.addConstraint(bottom)
    }
    
    internal static func applyLeftConstraint(subview: UIView, constant: CGFloat, superview: UIView) {
        let left = superview.leftAnchor.constraint(equalTo: subview.leftAnchor, constant: -constant)
        superview.addConstraint(left)
    }
    
    internal static func applyRightConstraint(subview: UIView, constant: CGFloat, superview: UIView) {
        let right = superview.rightAnchor.constraint(equalTo: subview.rightAnchor, constant: constant)
        superview.addConstraint(right)
    }
    
    internal static func applyMarginConstraints(subview: UIView, edgeInsets: UIEdgeInsets, superview: UIView) {
        self.applyTopConstraint(subview: subview, constant: edgeInsets.top, superview: superview)
        self.applyBottomConstraint(subview: subview, constant: edgeInsets.bottom, superview: superview)
        self.applyLeftConstraint(subview: subview, constant: edgeInsets.left, superview: superview)
        self.applyRightConstraint(subview: subview, constant: edgeInsets.right, superview: superview)
    }
    
    internal static func applyHeightConstraint(view: UIView, constant: CGFloat) {
        let height = view.heightAnchor.constraint(equalToConstant: constant)
        view.addConstraint(height)
    }
    
    internal static func applyWidthConstraint(view: UIView, constant: CGFloat) {
        let width = view.widthAnchor.constraint(equalToConstant: constant)
        view.addConstraint(width)
    }
    
    internal static func applySizeConstraints(view: UIView, size: CGSize) {
        self.applyWidthConstraint(view: view, constant: size.width)
        self.applyHeightConstraint(view: view, constant: size.height)
    }
    
    internal static func applyHorizontalCenterConstraint(subview: UIView, constant: CGFloat, superview: UIView) {
        let horizontalCenter = NSLayoutConstraint(item: subview, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1.0, constant: constant)
        superview.addConstraint(horizontalCenter)
    }
    
    internal static func applyVerticalCenterConstraint(subview: UIView, constant: CGFloat, superview: UIView) {
        let verticalCenter = NSLayoutConstraint(item: subview, attribute: .centerY, relatedBy: .equal, toItem: superview, attribute: .centerY, multiplier: 1.0, constant: constant)
        superview.addConstraint(verticalCenter)
    }
    
    internal static func applyCenterConstraints(subview: UIView, superview: UIView) {
        self.applyHorizontalCenterConstraint(subview: subview, constant: 0.0, superview: superview)
        self.applyVerticalCenterConstraint(subview: subview, constant: 0.0, superview: superview)
    }
    
}
