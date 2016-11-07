//
//  TrainingSession.swift
//  PushUps
//
//  Created by Andrew Walker on 02/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import Foundation

protocol Training: Session {
    var stage: Stage { get }
    var completed: Bool { get set }
}

class TrainingSession: Training {
    var stage: Stage
    var date: Date?
    var duration = 0
    var pushups = 0
    var completed = false
    
    init(stage: Stage) {
        self.stage = stage
    }
    
    func endSession() {
        self.duration = self.getDuration()
    }
}
