//
//  WorkoutSession.swift
//  PushUps
//
//  Created by Andrew Walker on 02/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import Foundation

protocol Workout: Session {
    var target: Int { get }
}

struct WorkoutSession: Workout {
    var target: Int
    var date = NSDate()
    var duration = 0
    var pushups = 0
    
    init(target: Int) {
        self.target = target
    }
}
