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
    
    // MARK: Properties -
    
    // MARK: Private
    
    private weak var delegate: HomeWorkoutViewControllerProxyDelegate?
    
    // MARK: Public
    
    // MARK: Lifecycle -
    
    /**
     Designated initializer for HomeWorkoutViewControllerProxy instance.
     - parameters:
        - delegate: An instance that conforms to HomeWorkoutViewControllerProxyDelegate protocol.
     */
    init(delegate: HomeWorkoutViewControllerProxyDelegate) {
        self.delegate = delegate
    }
    
    // MARK: Public -
    
    /**
    
    */
    func getLastSessionPushupCount() -> Int? {
        let previousSession = UserController.sharedInstance.getPreviousSession()
        return previousSession?.pushups
    }
    
}
