//
//  HomeTrainingViewControllerProxy.swift
//  PushUps
//
//  Created by Andrew Walker on 07/10/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

internal protocol HomeTrainingViewControllerProxyDelegate: class {
    var proxy: HomeTrainingViewControllerProxy? { get set }
}

internal final class HomeTrainingViewControllerProxy {
    
    // MARK: - Private Properties
    
    private weak var delegate: HomeTrainingViewControllerProxyDelegate?
    
    // MARK: - Lifecycle
    
    /**
     Designated initializer for HomeTrainingViewControllerProxy instance.
     - parameters:
        - delegate: An instance that conforms to HomeTrainingViewControllerProxyDelegate protocol.
     */
    internal init(delegate: HomeTrainingViewControllerProxyDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Internal Functions
    
    /**
     Gets number of stages in current training level.
     - returns: Int value representing number of stages in current level.
     */
    internal func currentStageCount() -> Int {
        return SessionController.sharedInstance.currentStageCount()
    }
    
    /**
     Gets index of current stage in training level.
     - returns: Int value representing index of current stage in training level.
     */
    internal func currentStageIndex() -> Int {
        return SessionController.sharedInstance.currentStageIndex()
    }
    
    /**
     Gets sets in current stage.
     - returns: Array of instances conforming to Set protocol.
    */
    internal func currentStageSets() -> [Set] {
        return SessionController.sharedInstance.currentStageSets()
    }
    
}
