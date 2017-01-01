//
//  UserController.swift
//  PushUps
//
//  Created by Andrew Walker on 05/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

internal final class UserController {
    
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
     Removes currently stored user.
     */
    internal func removeCurrentUser() {
        self.user = nil
    }
    
    internal func numberOfCompletedSessions() -> Int {
        return self.user?.sessions.count ?? 0
    }
    
}
