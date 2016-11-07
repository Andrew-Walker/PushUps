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
     
     */
    func startSession() {
        SessionController.sharedInstance.startNewWorkoutSession()
    }
    
    /**
     
     */
    func endSession(withCount count: Int) {
        SessionController.sharedInstance.endCurrentWorkoutSession(with: count)
        guard let completedSession = SessionController.sharedInstance.getCurrentSession() else {
            return
            
        }
        
        UserController.sharedInstance.add(session: completedSession)
        SessionController.sharedInstance.clearCurrentSession()
    }
    
}
