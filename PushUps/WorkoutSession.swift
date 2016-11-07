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
    var date: Date?
    var duration = 0
    var pushups = 0
    
    func endSession(with count: Int) {
        self.pushups = count
        self.duration = self.getDuration()
    }
}
