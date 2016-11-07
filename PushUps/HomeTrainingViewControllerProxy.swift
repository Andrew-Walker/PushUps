//
//  HomeTrainingViewControllerProxy.swift
//  PushUps
//
//  Created by Andrew Walker on 07/10/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

protocol HomeTrainingViewControllerProxyDelegate: class {
    var proxy: HomeTrainingViewControllerProxy? { get set }
}

class HomeTrainingViewControllerProxy {
    
    // MARK: Properties -
    
    // MARK: Private
    
    private weak var delegate: HomeTrainingViewControllerProxyDelegate?
    
    // MARK: Public
    
    // MARK: Lifecycle -
    
    /**
     Designated initializer for HomeTrainingViewControllerProxy instance.
     - parameters:
        - delegate: An instance that conforms to HomeTrainingViewControllerProxyDelegate protocol.
     */
    init(delegate: HomeTrainingViewControllerProxyDelegate) {
        self.delegate = delegate
    }
    
    // MARK: Public -
    
    /**
     Gets number of stages in current training level.
     - returns: Int value representing number of stages in current level.
     */
    func currentStageCount() -> Int {
        return SessionController.sharedInstance.getCurrentStageCount()
    }
    
    /**
     Gets index of current stage in training level.
     - returns: Int value representing index of current stage in training level.
     */
    func currentStageIndex() -> Int {
        return SessionController.sharedInstance.getCurrentStageIndex()
    }
    
    /**
     Gets sets in current stage.
     - returns: Array of instances conforming to Set protocol.
    */
    func currentStageSets() -> [Set] {
        return SessionController.sharedInstance.getCurrentStageSets()
    }
    
}
