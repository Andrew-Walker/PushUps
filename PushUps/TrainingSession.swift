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
    var id: String { get }
}

struct TrainingSession: Training {
    var stage: Stage
    var date: NSDate?
    var duration = 0
    var pushups = 0
    var completed = false
    var id: String
    
    init(stage: Stage, id: String) {
        self.stage = stage
        self.id = id
    }
}

extension TrainingSession {
    mutating func endSession(withCount count: Int) {
        self.pushups = count
        self.duration = self.getDuration()
        self.completed = self.isCompleted(count: count)
    }
    
    private mutating func isCompleted(count: Int) -> Bool {
        return self.stage.sets.flatMap({ $0.pushups }).reduce(0, combine: +) == count
    }
}
