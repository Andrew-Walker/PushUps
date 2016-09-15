//
//  Session.swift
//  PushUps
//
//  Created by Andrew Walker on 02/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import Foundation

protocol Session {
    var date: NSDate? { get set }
    var duration: Int { get set }
    var pushups: Int { get set }
    
    mutating func endSession(withCount count: Int)
    func getDuration() -> Int
}

extension Session {
    mutating func startSession() {
        self.date = NSDate()
    }
    
    func getDuration() -> Int {
        // TODO: End timer and get duration.
        
        return 0
    }
}
