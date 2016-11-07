//
//  HomeWorkoutViewControllerProxy.swift
//  PushUps
//
//  Created by Andrew Walker on 06/11/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

protocol HomeWorkoutViewControllerProxyDelegate: class {
    var proxy: HomeWorkoutViewControllerProxy? { get set }
}

class HomeWorkoutViewControllerProxy {
    
    // MARK: - Properties -
    
    // MARK: Private
    
    private weak var delegate: HomeWorkoutViewControllerProxyDelegate?
    
    // MARK: Internal
    
    // MARK: - Lifecycle -
    
    /**
     Designated initializer for HomeWorkoutViewControllerProxy instance.
     - parameters:
        - delegate: An instance that conforms to HomeWorkoutViewControllerProxyDelegate protocol.
     */
    internal init(delegate: HomeWorkoutViewControllerProxyDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Internal -
    
    /**
     Gets number of pushups achieved in last session.
     - returns: Int value representing pushup count.
    */
    internal func getLastSessionPushupCount() -> Int? {
        let previousSession = UserController.sharedInstance.getPreviousSession()
        return previousSession?.pushups
    }
    
}
