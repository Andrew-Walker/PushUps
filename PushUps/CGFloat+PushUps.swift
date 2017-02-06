//
//  CGFloat+PushUps.swift
//  PushUps
//
//  Created by Andrew Walker on 30/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal extension CGFloat {
    
    // MARK: - Internal Functions
    
    /**
     
    */
    internal func balanced() -> CGFloat {
        return self <= 0.5 ?  1.0 - (self * 2) : -(1.0 - (self * 2))
    }
    
}
