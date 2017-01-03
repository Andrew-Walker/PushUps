//
//  Session.swift
//  PushUps
//
//  Created by Andrew Walker on 02/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import Foundation

internal protocol Session {
    var date: Date? { get set }
    var duration: TimeInterval { get set }
    var pushups: Int { get set }
    
    func totalDuration() -> TimeInterval
    func start()
}

internal extension Session {
    
    // MARK: - Internal Functions
    
    internal func totalDuration() -> TimeInterval {
        guard let startDate = self.date else {
            return 0
        }
        
        let endDate = Date()
        let duration = endDate.timeIntervalSince(startDate)
        return duration
    }
    
}
