//
//  Session.swift
//  PushUps
//
//  Created by Andrew Walker on 02/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import Foundation

protocol Session {
    var date: Date? { get set }
    var duration: Int { get set }
    var pushups: Int { get set }
    
    func getDuration() -> Int
}

extension Session {
    mutating func startSession() {
        self.date = Date()
    }
    
    func getDuration() -> Int {
        let endDate = Date()
        
        return 0
    }
}
