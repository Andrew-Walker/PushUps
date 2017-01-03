//
//  TrainingSession.swift
//  PushUps
//
//  Created by Andrew Walker on 02/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import Foundation

internal protocol Training: Session {
    var stage: Stage { get }
}

internal final class TrainingSession: Training {
    
    // MARK: - Internal Properties
    
    internal var stage: Stage
    internal var date: Date?
    internal var duration: TimeInterval = 0.0
    internal var pushups = 0
    
    // MARK: - Lifecycle
    
    internal init(stage: Stage) {
        self.stage = stage
    }
    
    // MARK: - Internal Functions
    
    internal func start() {
        self.date = Date()
        
        self.stage.start()
    }
    
    internal func setNextSet() {
        self.stage.setNextSet()
    }
    
    internal func end() {
        self.duration = self.totalDuration()
        self.pushups = self.stage.sets.flatMap({ $0.pushups }).reduce(0, +)
    }
    
}
