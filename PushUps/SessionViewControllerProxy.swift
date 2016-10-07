//
//  SessionViewControllerProxy.swift
//  PushUps
//
//  Created by Andrew Walker on 06/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

protocol SessionViewControllerProxyDelegate: class {
    var proxy: SessionViewControllerProxy? { get set }
}

class SessionViewControllerProxy {
    
    // MARK: Properties -
    
    // MARK: Private
    
    private weak var delegate: SessionViewControllerProxyDelegate?
    
    // MARK: Public
    
    // MARK: Lifecycle -
    
    /**
     Designated initializer for SessionViewControllerProxy instance.
     - parameters:
        - delegate: An instance that conforms to SessionViewControllerProxy protocol.
     */
    init(delegate: SessionViewControllerProxyDelegate) {
        self.delegate = delegate
    }
    
    // MARK: Public -
    
    /**
     Gets user's current pushup record.
     - returns: Int value representing pushup record.
     */
    func currentRecord() -> Int {
        guard let user = UserController.sharedInstance.currentPushUpUser() else {
            return 0
        }
        
        return user.record
    }
    
    func startSession() {
        SessionController.sharedInstance.startNewSession()
    }
    
    func endSession(withCount count: Int) {
        SessionController.sharedInstance.endCurrentSession(withCount: count)
    }
    
}
