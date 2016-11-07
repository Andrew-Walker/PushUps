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
    
    private(set) var user: User?
    
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
    internal func setUser(user: User?) {
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
     Gets most recent PushUpUser session.
     - returns: Instance conforming to Session most recently completed.
     */
    internal func getPreviousSession() -> Session? {
        return (self.user as? PushUpUser)?.getPreviousSession()
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
