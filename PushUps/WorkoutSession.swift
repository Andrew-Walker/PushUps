//
//  WorkoutSession.swift
//  PushUps
//
//  Created by Andrew Walker on 02/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import Foundation

protocol Workout: Session {}

class WorkoutSession: Workout {
    
    // MARK: - Properties -
    
    // MARK: Private
    
    // MARK: Internal
    
    internal var date: Date?
    internal var duration = 0
    internal var pushups = 0
    
    // MARK: - Internal -
    
    internal func endSession(with count: Int) {
        self.pushups = count
        self.duration = self.getDuration()
    }
    
}
