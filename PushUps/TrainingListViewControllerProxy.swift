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
    
    // MARK: - Properties -
    
    // MARK: Private
    
    private weak var delegate: TrainingListViewControllerProxyDelegate?
    
    // MARK: Internal
    
    // MARK: - Lifecycle -
    
    /**
     
     */
    internal init(delegate: TrainingListViewControllerProxyDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Internal -
    
    /**
     
     */
    internal func levels() -> [Level] {
        return SessionController.sharedInstance.allLevels
    }
    
}
