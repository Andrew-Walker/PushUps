//
//  TrainingListViewControllerProxy.swift
//  PushUps
//
//  Created by Andrew Walker on 03/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

internal protocol TrainingListViewControllerProxyDelegate: class {
    var proxy: TrainingListViewControllerProxy? { get set }
}

internal final class TrainingListViewControllerProxy {
    
    // MARK: - Private Properties
    
    private weak var delegate: TrainingListViewControllerProxyDelegate?
    
    // MARK: - Lifecycle
    
    /**
     
     */
    internal init(delegate: TrainingListViewControllerProxyDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Internal Functions
    
    /**
     
     */
    internal func levels() -> [Level] {
        return SessionController.sharedInstance.allLevels
    }
    
}
