//
//  TrainingListViewControllerProxy.swift
//  PushUps
//
//  Created by Andrew Walker on 03/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import Foundation

internal protocol TrainingListViewControllerProxyDelegate: class {
    var proxy: TrainingListViewControllerProxy? { get set }
}

internal final class TrainingListViewControllerProxy {
    
    // MARK: - Private Properties
    
    private weak var delegate: TrainingListViewControllerProxyDelegate?
    
    // MARK: - Lifecycle
    
    /**
     Designated initializer for TrainingListViewControllerProxy instance.
     - parameters:
        - delegate: An instance that conforms to TrainingListViewControllerProxyDelegate protocol.
     */
    internal init(delegate: TrainingListViewControllerProxyDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Internal Functions
    
    /**
     Gets all training levels.
     - returns: Array of instances conforming to Level.
     */
    internal func levels() -> [Level] {
        return SessionController.sharedInstance.allLevels
    }
    
    /**
     Gets current training stage.
     - returns: Instance conforming to Stage.
    */
    internal func currentStage() -> Stage? {
        return SessionController.sharedInstance.currentTrainingStage()
    }
    
    /**
     Updates user's current training stage and level.
     - parameters:
        - currentLevel: Instance conforming to Level protocol.
        - currentStage: Instance conforming to Stage protocol.
    */
    internal func set(currentLevel: Level?, currentStage: Stage?) {
        guard let level = currentLevel, let stage = currentStage else {
            return
        }
        
        UserController.sharedInstance.set(levelID: level.id, stageID: stage.id)
    }
    
}
