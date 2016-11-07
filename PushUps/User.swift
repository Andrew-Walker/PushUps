//
//  User.swift
//  PushUps
//
//  Created by Andrew Walker on 05/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import Foundation

protocol User {
    var name: String { get set }
    var dateJoined: NSDate { get }
    var profileImage: NSData? { get set }
    var sessions: [Session] { get set }
    var record: Int { get set }
    var currentSessionIDs: (level: String, stage: String)? { get set }
}

class PushUpUser: User {
    var name: String
    var dateJoined: NSDate
    var profileImage: NSData? = nil
    var sessions: [Session] = []
    var record = 0
    var currentSessionIDs: (level: String, stage: String)?
    
    init(name: String) {
        self.name = name
        self.dateJoined = NSDate()
    }
    
    func set(levelID: String, stageID: String) {
        self.currentSessionIDs = (level: levelID, stage: stageID)
    }
    
    func add(session: Session) {
        self.sessions.append(session)
    }
    
    func getPreviousSession() -> Session? {
        return self.sessions.last
    }
}
