//
//  UserController.swift
//  PushUps
//
//  Created by Andrew Walker on 05/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

class UserController {
    
    // MARK: - Properties -
    
    // MARK: Private
    
    private var user: User?
    
    // MARK: Internal
    
    internal static let sharedInstance = UserController()
    
    // MARK: - Lifecycle -
    
    /**
     Restricts ability to create instance. Intended as singleton.
     */
    private init() {}
    
    // MARK: - Internal -
    
    /**
     Sets current user.
     - parameters:
        - user: Instance conforming to User protocol representing new user.
     */
    internal func set(user: User?) {
        self.user = user
    }
    
    /**
     Removes currently stored user.
     */
    internal func removeCurrentUser() {
        self.user = nil
    }
    
    /**
     Adds session to current PushUpUser session array.
     - parameters:
        - session: Instance conforming to Session to add to array.
     */
    internal func add(session: Session) {
        (self.user as? PushUpUser)?.add(session: session)
    }
    
    /**
     
    */
    internal func set(levelID: String?, stageID: String?) {
        (self.user as? PushUpUser)?.set(levelID: levelID, stageID: stageID)
    }
    
    /**
     Gets total number of completed sessions.
     - returns: Int value representing total completed sessions.
    */
    internal func totalSessionCount() -> Int? {
        return (self.user as? PushUpUser)?.sessions.count
    }
    
    /**
     Gets most recent PushUpUser session.
     - returns: Instance conforming to Session most recently completed.
     */
    internal func mostRecentSession() -> Session? {
        return (self.user as? PushUpUser)?.mostRecentSession()
    }
    
    /**
     Gets session at specified index.
     - returns: Instance conforming to Session at index path.
    */
    internal func session(at index: Int) -> Session? {
        return (self.user as? PushUpUser)?.session(at: index)
    }
    
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
    
}
