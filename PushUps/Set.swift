//
//  Set.swift
//  PushUps
//
//  Created by Andrew Walker on 02/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

protocol Set {
    var pushups: Int { get }
    var interval: Int { get }
    var isCurrent: Bool { get set }
}

struct TrainingSet: Set {
    
    // MARK: - Properties -
    
    // MARK: Private
    
    // MARK: Internal
    
    internal var pushups: Int
    internal var interval: Int
    internal var isCurrent = false
    
    // MARK: - Lifecycle -
    
    internal init(pushups: Int, interval: Int) {
        self.pushups = pushups
        self.interval = interval
    }
    
}
