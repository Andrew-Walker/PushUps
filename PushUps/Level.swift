//
//  Level.swift
//  PushUps
//
//  Created by Andrew Walker on 15/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

protocol Level {
    var id: String { get }
    var stages: [Stage] { get }
}

struct TrainingLevel: Level {
    
    // MARK: - Properties -
    
    // MARK: Private
    
    // MARK: Internal
    
    internal var id: String
    internal var stages: [Stage]
    
}
