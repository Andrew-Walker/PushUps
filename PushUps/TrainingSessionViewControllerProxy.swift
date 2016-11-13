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
     Gets sets in current stage.
     - returns: Array of instances conforming to Set protocol.
     */
    internal func activeStageSets() -> [Set] {
        return SessionController.sharedInstance.activeStageSets()
    }
    
    /**
     
    */
    internal func activeStageSet() -> Set? {
        return SessionController.sharedInstance.activeStageActiveSet()
    }
    
    /**
     
    */
    internal func incrementActiveSet() {
        let activeSession = SessionController.sharedInstance.activeSession() as? TrainingSession
        activeSession?.setNextSet()
    }
    
}
