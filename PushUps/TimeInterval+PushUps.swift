//
//  TimeInterval+PushUps.swift
//  PushUps
//
//  Created by Andrew Walker on 13/11/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import Foundation

internal extension TimeInterval {
    
    // MARK: - Internal Functions
    
    /**
     Creates string with formatted minutes and seconds from time interval.
     - returns: String instance containing minutes and seconds.
    */
    internal func toMinutesSeconds() -> String {
        let interval = Int(self)
        let seconds = interval % 60
        let minutes = (interval / 60) % 60
        
        let string = String(format: "%0.2d:%0.2d", minutes, seconds)
        return string
    }
    
}
