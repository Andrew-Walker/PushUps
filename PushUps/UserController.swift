//
//  UserController.swift
//  PushUps
//
//  Created by Andrew Walker on 06/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

class UserController {
    
    // MARK: Lifecycle -
    
    /**
     Restricts ability to create instance. Intended as singleton.
     */
    private init() {}
    
    // MARK: Public -
    
    /**
     Gets PushUpUser instance representing current user.
     - returns: Instance conforming to PushUpUser representing current user.
     */
    static func currentPushUpUser() -> PushUpUser? {
        guard let user = UserManager.sharedInstance.user as? PushUpUser else {
            return nil
        }
        
        return user
    }
    
}
