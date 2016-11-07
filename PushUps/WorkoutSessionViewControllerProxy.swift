//
//  WorkoutSessionViewControllerProxy.swift
//  PushUps
//
//  Created by Andrew Walker on 06/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

protocol WorkoutSessionViewControllerProxyDelegate: class {
    var proxy: WorkoutSessionViewControllerProxy? { get set }
}

class WorkoutSessionViewControllerProxy {
    
    // MARK: Properties -
    
    // MARK: Private
    
    private weak var delegate: WorkoutSessionViewControllerProxyDelegate?
    
    // MARK: Public
    
    // MARK: Lifecycle -
    
    /**
     Designated initializer for WorkoutSessionViewControllerProxy instance.
     - parameters:
        - delegate: An instance that conforms to WorkoutSessionViewControllerProxyDelegate protocol.
     */
    init(delegate: WorkoutSessionViewControllerProxyDelegate) {
        self.delegate = delegate
    }
    
    // MARK: Public -
    
    /**
     Gets user's current pushup record.
     - returns: Int value representing pushup record.
     */
    func currentRecord() -> Int {
        guard let user = UserController.sharedInstance.currentPushUpUser() else {
            return 0
        }
        
        return user.record
    }
    
    /**
     Starts new workout session.
     */
    func startSession() {
        SessionController.sharedInstance.startNewWorkoutSession()
    }
    
    /**
     Ends in-progress workout session, adds to current user history and clears currently stored session.
     - parameters:
        - count: Int value representing total pushups completed.
     */
    func endSession(with count: Int) {
        SessionController.sharedInstance.endCurrentWorkoutSession(with: count)
        guard let completedSession = SessionController.sharedInstance.getCurrentSession() else {
            return
            
        }
        
        UserController.sharedInstance.add(session: completedSession)
        SessionController.sharedInstance.clearCurrentSession()
    }
    
}
