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
    
    // MARK: - Internal Properties
    
    internal var stage: Stage
    internal var date: Date?
    internal var duration = 0
    internal var pushups = 0
    internal var completed = false
    
    init(stage: Stage) {
        self.stage = stage
    }
    
    internal func endSession() {
        self.duration = self.getDuration()
    }
}
