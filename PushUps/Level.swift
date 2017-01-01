//
//  Level.swift
//  PushUps
//
//  Created by Andrew Walker on 15/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

internal protocol Level {
    var id: String { get }
    var stages: [Stage] { get }
}

internal final class TrainingLevel: Level {
    
    // MARK: - Properties -
    
    // MARK: Private
    
    // MARK: Internal
    
    internal var id: String
    internal var stages: [Stage]
    
    // MARK: - Lifecycle -
    
    init(id: String, stages: [Stage]) {
        self.id = id
        self.stages = stages
    }
    
}
