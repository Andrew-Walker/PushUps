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
}

class TrainingSession: Training {
    
    // MARK: - Properties -
    
    // MARK: Private
    
    // MARK: Internal
    
    internal var stage: Stage
    internal var date: Date?
    internal var duration: TimeInterval = 0
    internal var pushups = 0
    
    // MARK: - Lifecycle -
    
    internal init(stage: Stage) {
        self.stage = stage
    }
    
    // MARK: - Internal -
    
    internal func start() {
        self.date = Date()
        
        self.stage.start()
    }
    
    internal func setNextSet() {
        self.stage.setNextSet()
    }
    
    internal func end() {
        self.duration = self.totalDuration()
    }
    
}
