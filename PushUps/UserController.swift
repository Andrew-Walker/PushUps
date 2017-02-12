//
//  UserController.swift
//  PushUps
//
//  Created by Andrew Walker on 05/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

internal final class UserController {
    
    // MARK: - Private Properties
    
    private var user: User?
    
    // MARK: - Internal Properties
    
    internal static let sharedInstance = UserController()
    
    // MARK: - Lifecycle
    
    /**
     Restricts ability to create instance. Intended as singleton.
     */
    private init() {}
    
    // MARK: - Internal Functions
    
    /**
     Gets PushUpUser instance representing current user.
     - returns: Instance conforming to PushUpUser representing current user.
     */
    internal func currentPushUpUser() -> PushUpUser? {
        guard let user = self.user as? PushUpUser else {
            return nil
        }
        
        return user
    }
    
    /**
     Sets current user.
     - parameters:
        - user: Instance conforming to User protocol representing new user.
     */
    internal func set(user: User?) {
        self.user = user
    }
    
    /**
     Sets user's current level and stage based on ID.
     - parameters:
        - levelID: Unique string ID representing level.
        - stageID: Unique string ID representing stage.
    */
    internal func set(levelID: String, stageID: String) {
        (self.user as? PushUpUser)?.set(levelID: levelID, stageID: stageID)
    }
    
    /**
     Removes currently stored user.
     */
    internal func removeCurrentUser() {
        self.user = nil
    }
    
    /**
     Gets total number of sessions completed by user.
     - returns: Int value representing number of completed sessions.
    */
    internal func numberOfCompletedSessions() -> Int {
        return self.user?.sessions.count ?? 0
    }
    
    /**
     
    */
    internal func personalBest() -> Int {
        let sessions = self.user?.sessions.flatMap({ $0 as? WorkoutSession })
        let sortedSessions = sessions?.sorted(by: { $0.pushups < $1.pushups })
        let personalBest = sortedSessions?.last?.pushups ?? 0
        return personalBest
    }
    
}
