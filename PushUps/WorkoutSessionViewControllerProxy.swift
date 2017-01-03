//
//  WorkoutSessionViewControllerProxy.swift
//  PushUps
//
//  Created by Andrew Walker on 06/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

internal protocol WorkoutSessionViewControllerProxyDelegate: class {
    var proxy: WorkoutSessionViewControllerProxy? { get set }
}

internal final class WorkoutSessionViewControllerProxy {
    
    // MARK: - Private Properties
    
    private weak var delegate: WorkoutSessionViewControllerProxyDelegate?
    
    // MARK: - Lifecycle
    
    /**
     Designated initializer for WorkoutSessionViewControllerProxy instance.
     - parameters:
        - delegate: An instance that conforms to WorkoutSessionViewControllerProxyDelegate protocol.
     */
    internal init(delegate: WorkoutSessionViewControllerProxyDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Internal Functions
    
    /**
     Gets user's current pushup record.
     - returns: Int value representing pushup record.
     */
    internal func currentRecord() -> Int {
        guard let user = UserController.sharedInstance.currentPushUpUser() else {
            return 0
        }
        
        return user.record
    }
    
    /**
     Starts new workout session.
     */
    internal func activateSession() {
        SessionController.sharedInstance.activateWorkoutSession()
    }
    
    /**
     Ends in-progress workout session, adds to current user history and clears currently stored session.
     - parameters:
        - count: Int value representing total pushups completed.
     */
    internal func endSession(with count: Int) {
        SessionController.sharedInstance.endActiveWorkoutSession(with: count)
        guard let completedSession = SessionController.sharedInstance.activeSession else {
            return
        }
        
        SessionController.sharedInstance.clearActiveSession()
        
        let user = UserController.sharedInstance.currentPushUpUser()
        user?.add(session: completedSession)
    }
    
}
