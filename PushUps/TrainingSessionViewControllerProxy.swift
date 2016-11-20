//
//  TrainingSessionViewControllerProxy.swift
//  PushUps
//
//  Created by Andrew Walker on 30/10/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

protocol TrainingSessionViewControllerProxyDelegate: class {
    var proxy: TrainingSessionViewControllerProxy? { get set }
}

class TrainingSessionViewControllerProxy {
    
    // MARK: Properties -
    
    // MARK: Private
    
    private weak var delegate: TrainingSessionViewControllerProxyDelegate?
    
    // MARK: Internal
    
    // MARK: Lifecycle -
    
    /**
     Designated initializer for TrainingSessionViewControllerProxy instance.
     - parameters:
        - delegate: An instance that conforms to TrainingSessionViewControllerProxyDelegate protocol.
     */
    internal init(delegate: TrainingSessionViewControllerProxyDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Internal -
    
    /**
     Starts new training session.
     */
    internal func startSession() {
        SessionController.sharedInstance.activateTrainingSession()
    }
    
    /**
     
    */
    internal func endSession() {
        SessionController.sharedInstance.endActiveTrainingSession()
        SessionController.sharedInstance.clearActiveSession()
    }
    
    /**
     Gets sets in current stage.
     - returns: Array of instances conforming to Set protocol.
     */
    internal func activeStageSets() -> [Set] {
        return SessionController.sharedInstance.activeStageSets()
    }
    
    /**
     Gets currently active set from current stage.
     - returns: Instance conforming to Set protocol.
    */
    internal func activeStageSet() -> Set? {
        return SessionController.sharedInstance.activeStageActiveSet()
    }
    
    /**
     Increments active set in current stage.
    */
    internal func incrementActiveSet() {
        let activeSession = SessionController.sharedInstance.activeSession() as? TrainingSession
        activeSession?.setNextSet()
    }
    
}
