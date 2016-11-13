//
//  HomeWorkoutViewControllerProxy.swift
//  PushUps
//
//  Created by Andrew Walker on 06/11/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

protocol HomeWorkoutViewControllerProxyDelegate: class {
    var proxy: HomeWorkoutViewControllerProxy? { get set }
}

class HomeWorkoutViewControllerProxy {
    
    // MARK: - Properties -
    
    // MARK: Private
    
    private weak var delegate: HomeWorkoutViewControllerProxyDelegate?
    
    // MARK: Internal
    
    // MARK: - Lifecycle -
    
    /**
     Designated initializer for HomeWorkoutViewControllerProxy instance.
     - parameters:
        - delegate: An instance that conforms to HomeWorkoutViewControllerProxyDelegate protocol.
     */
    internal init(delegate: HomeWorkoutViewControllerProxyDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Internal -
    
    /**
     Gets number of pushups achieved in last session.
     - returns: String representing pushup count.
    */
    internal func mostRecentSessionPushupCount() -> String? {
        let previousSession = UserController.sharedInstance.mostRecentSession()
        let pushupCount = previousSession?.pushups ?? 0
        
        return String(pushupCount)
    }
    
    /**
     Gets pushup count difference between two most recent sessions.
     - returns: String representing pushup count difference.
    */
    internal func pushUpCountDifference() -> String {
        let totalSessionCount = UserController.sharedInstance.totalSessionCount() ?? 0
        let priorSessionIndex = totalSessionCount - 2
        let previousSession = UserController.sharedInstance.mostRecentSession()
        let priorSession = UserController.sharedInstance.session(at: priorSessionIndex)
        
        return String.differenceBetween(previousSession: previousSession, priorSession: priorSession)
    }
    
    /**
     Gets most recent session duration as string.
     - returns: String representing duration in minutes and seconds.
    */
    internal func mostRecentSessionDuration() -> String {
        guard let previousSession = UserController.sharedInstance.mostRecentSession() else {
            return "00:00"
        }
        
        let durationString = previousSession.duration.toMinutesSeconds()
        return durationString
    }
    
}
