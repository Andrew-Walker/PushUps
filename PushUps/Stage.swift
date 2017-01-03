//
//  Stage.swift
//  PushUps
//
//  Created by Andrew Walker on 15/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

internal protocol Stage {
    var id: String { get }
    var sets: [Set] { get }
    var isCompleted: Bool { get set }
    
    func start()
    func setNextSet()
}

internal final class TrainingStage: Stage {
    
    // MARK: - Internal Properties
    
    internal var id: String
    internal var sets: [Set]
    internal var isCompleted = false
    
    // MARK: - Lifecycle
    
    internal init(id: String, sets: [Set]) {
        self.id = id
        self.sets = sets
    }
    
    // MARK: - Internal Functions
    
    internal func start() {
        self.setNextSet()
    }
    
    internal func setNextSet() {
        guard let currentSetIndex = self.sets.index(where: { $0.isCurrent }) else {
            var firstSet = self.sets.first
            firstSet?.isCurrent = true
            
            return
        }
        
        var currentSet = self.sets.object(at: currentSetIndex)
        currentSet?.isCompleted = true
        currentSet?.isCurrent = false
        
        let nextSetIndex = currentSetIndex + 1
        guard var nextSet = self.sets.object(at: nextSetIndex) else {
            currentSet?.isCompleted = true
            self.isCompleted = true
            
            return
        }
        
        nextSet.isCurrent = true
    }
    
}
