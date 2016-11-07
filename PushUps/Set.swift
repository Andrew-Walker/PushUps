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
    var pushups: Int
    var interval: Int
    var isCurrent = false
    
    init(pushups: Int, interval: Int) {
        self.pushups = pushups
        self.interval = interval
    }
}
