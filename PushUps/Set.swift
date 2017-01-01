//
//  Set.swift
//  PushUps
//
//  Created by Andrew Walker on 02/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import Foundation

internal protocol Set {
    var pushups: Int { get }
    var interval: TimeInterval { get }
    var isCompleted: Bool { get set }
    var isCurrent: Bool { get set }
}

internal final class TrainingSet: Set {
    
    // MARK: - Properties -
    
    // MARK: Private
    
    // MARK: Internal
    
    internal var pushups: Int
    internal var interval: TimeInterval
    internal var isCompleted = false
    internal var isCurrent = false
    
    // MARK: - Lifecycle -
    
    internal init(pushups: Int, interval: TimeInterval) {
        self.pushups = pushups
        self.interval = interval
    }
    
}
