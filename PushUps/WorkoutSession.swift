//
//  WorkoutSession.swift
//  PushUps
//
//  Created by Andrew Walker on 02/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import Foundation

protocol Workout: Session {}

struct WorkoutSession: Workout {
    var date: NSDate?
    var duration = 0
    var pushups = 0
}

extension WorkoutSession {
    mutating func endSession(withCount count: Int) {
        self.pushups = count
        self.duration = self.getDuration()
    }
}
