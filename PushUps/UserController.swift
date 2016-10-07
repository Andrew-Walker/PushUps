//
//  UserController.swift
//  PushUps
//
//  Created by Andrew Walker on 05/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

class UserController {
    
    // MARK: Properties -
    
    // MARK: Public
    
    static let sharedInstance = UserController()
    
    // MARK: Private
    
    private(set) var user: User?
    
    // MARK: Lifecycle -
    
    /**
     Restricts ability to create instance. Intended as singleton.
     */
    private init() {}
    
    /**
     Sets current user.
     - parameters:
        - user: Instance conforming to User protocol representing new user.
     */
    func setUser(user: User?) {
        self.user = user
    }
    
    /**
     Removes currently stored user.
     */
    func removeCurrentUser() {
        self.user = nil
    }
    
    
    /**
     Gets PushUpUser instance representing current user.
     - returns: Instance conforming to PushUpUser representing current user.
     */
    func currentPushUpUser() -> PushUpUser? {
        guard let user = self.user as? PushUpUser else {
            return nil
        }
        
        return user
    }
    
}
