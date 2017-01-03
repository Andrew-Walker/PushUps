//
//  WorkoutSession.swift
//  PushUps
//
//  Created by Andrew Walker on 02/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import Foundation

internal protocol Workout: Session {}

internal final class WorkoutSession: Workout {
    
    // MARK: - Internal Properties
    
    internal var date: Date?
    internal var duration: TimeInterval = 0.0
    internal var pushups = 0
    
    // MARK: - Internal Functions
    
    internal func start() {
        self.date = Date()
    }
    
    internal func end(with count: Int) {
        self.duration = self.totalDuration()
        self.pushups = count
    }
    
}
