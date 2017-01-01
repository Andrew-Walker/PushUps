//
//  ProfileViewControllerProxy.swift
//  PushUps
//
//  Created by Andrew Walker on 01/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

internal protocol ProfileViewControllerProxyDelegate: class {
    var proxy: ProfileViewControllerProxy? { get set }
}

internal final class ProfileViewControllerProxy {
    
    // MARK: - Properties -
    
    // MARK: Private
    
    private weak var delegate: ProfileViewControllerProxyDelegate?
    
    // MARK: Internal
    
    // MARK: - Lifecycle -
    
    /**
     
     */
    internal init(delegate: ProfileViewControllerProxyDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Internal -
    
    /**
     
     */
    internal func numberOfCompletedSessions() -> Int {
        return UserController.sharedInstance.numberOfCompletedSessions()
    }
    
}
