//
//  TrainingSessionViewControllerProxy.swift
//  PushUps
//
//  Created by Andrew Walker on 30/10/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

internal protocol TrainingSessionViewControllerProxyDelegate: class {
    var proxy: TrainingSessionViewControllerProxy? { get set }
}

internal final class TrainingSessionViewControllerProxy {
    
    // MARK: - Private Properties
    
    private weak var delegate: TrainingSessionViewControllerProxyDelegate?
    
    // MARK: - Lifecycle
    
    /**
     Designated initializer for TrainingSessionViewControllerProxy instance.
     - parameters:
        - delegate: An instance that conforms to TrainingSessionViewControllerProxyDelegate protocol.
     */
    internal init(delegate: TrainingSessionViewControllerProxyDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Internal Functions
    
    /**
     Starts new training session.
     */
    internal func startSession() {
        SessionController.sharedInstance.activateTrainingSession()
    }
    
    /**
     Configures user for next session, clears and ends current active session.
    */
    internal func endSession() {
        self.prepareNextSession()
        
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
        let activeSession = SessionController.sharedInstance.activeSession as? TrainingSession
        activeSession?.setNextSet()
    }
    
    // MARK: - Private Functions
    
    /**
     Verifies completed session and configures user for next session.
    */
    private func prepareNextSession() {
        guard let user = UserController.sharedInstance.currentPushUpUser() else {
            return
        }
        
        guard let session = SessionController.sharedInstance.activeSession as? TrainingSession, session.stage.isCompleted else {
            return
        }
        
        guard let nextStageIDs = SessionController.sharedInstance.nextTrainingStageIDs(for: user) else {
            return
        }
        
        user.set(levelID: nextStageIDs.levelID, stageID: nextStageIDs.stageID)
    }
    
}
