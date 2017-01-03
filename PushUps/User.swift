//
//  User.swift
//  PushUps
//
//  Created by Andrew Walker on 05/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import Foundation

internal protocol User {
    var name: String { get set }
    var dateJoined: Date { get }
    var profileImage: Data? { get set }
    var sessions: [Session] { get set }
    var record: Int { get set }
    var currentSessionIDs: (level: String, stage: String)? { get set }
}

internal final class PushUpUser: User {
    
    // MARK: - Internal Properties
    
    internal var name: String
    internal var dateJoined: Date
    internal var profileImage: Data?
    internal var sessions = [Session]()
    internal var record = 0
    internal var currentSessionIDs: (level: String, stage: String)?
    
    // MARK: - Lifecycle
    
    internal init(name: String) {
        self.name = name
        self.dateJoined = Date()
    }
    
    // MARK: - Internal Functions
    
    internal func set(levelID: String?, stageID: String?) {
        guard let levelID = levelID, let stageID = stageID else {
            return
        }
        
        self.currentSessionIDs = (level: levelID, stage: stageID)
    }
    
    internal func add(session: Session) {
        self.sessions.append(session)
    }
    
    internal func mostRecentSession() -> Session? {
        return self.sessions.last
    }
    
    internal func session(at index: Int) -> Session? {
        return self.sessions.object(at: index)
    }
    
}
