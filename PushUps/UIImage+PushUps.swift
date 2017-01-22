//
//  UIImage+PushUps.swift
//  PushUps
//
//  Created by Andrew Walker on 22/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal extension UIImage {
    
    // MARK: - Internal Functions
    
    internal func flipHorizontally() -> UIImage {
        guard let originalImage = self.cgImage else {
            return self
        }
        return UIImage(cgImage: originalImage, scale: 1.0, orientation: .upMirrored)
    }
    
}
