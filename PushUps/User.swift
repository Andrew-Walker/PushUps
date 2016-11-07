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
    
    // MARK: - Properties -
    
    // MARK: Private
    
    // MARK: Internal
    
    internal var name: String
    internal var dateJoined: NSDate
    internal var profileImage: NSData? = nil
    internal var sessions: [Session] = []
    internal var record = 0
    internal var currentSessionIDs: (level: String, stage: String)?
    
    // MARK: - Lifecycle -
    
    internal init(name: String) {
        self.name = name
        self.dateJoined = NSDate()
    }
    
    // MARK: - Internal -
    
    internal func set(levelID: String, stageID: String) {
        self.currentSessionIDs = (level: levelID, stage: stageID)
    }
    
    internal func add(session: Session) {
        self.sessions.append(session)
    }
    
    internal func getPreviousSession() -> Session? {
        return self.sessions.last
    }
    
}
