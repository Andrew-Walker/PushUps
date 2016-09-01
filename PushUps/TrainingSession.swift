//
//  TrainingSession.swift
//  PushUps
//
//  Created by Andrew Walker on 02/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import Foundation

protocol Training: Session {
    var sets: [SessionSet] { get }
}

struct TrainingSession: Training {
    var sets: [SessionSet]
    var date = NSDate()
    var duration = 0
    var pushups = 0
    
    init(sets: [SessionSet]) {
        self.sets = sets
    }
}
