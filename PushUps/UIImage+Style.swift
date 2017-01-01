//
//  UIImage+Style.swift
//  PushUps
//
//  Created by Andrew Walker on 06/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

internal extension UIImage {
    
    /**
     Creates image of solid color using specified size.
     - parameters:
        - ofSize: The dimensions of the image.
        - color: The solid color of the image.
     - returns: UIImage of solid color.
     */
    internal static func createImage(ofSize size: CGSize = CGSize(width: 1, height: 1), color: UIColor) -> UIImage {
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        color.setFill()
        context?.fill(CGRect(origin: CGPoint.zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()
        
        return image
    }
    
}
