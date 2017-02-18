//
//  WorkoutChartViewControllerProxy.swift
//  PushUps
//
//  Created by Andrew Walker on 18/02/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

internal protocol WorkoutChartViewControllerProxyDelegate: class {
    var proxy: WorkoutChartViewControllerProxy? { get set }
}

internal final class WorkoutChartViewControllerProxy {
    
    // MARK: - Private Properties
    
    private weak var delegate: WorkoutChartViewControllerProxyDelegate?
    
    // MARK: - Lifecycle
    
    /**
     Designated initializer for WorkoutChartViewControllerProxy instance.
     - parameters:
     - delegate: An instance that conforms to WorkoutChartViewControllerProxyDelegate protocol.
     */
    internal init(delegate: WorkoutChartViewControllerProxyDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Internal Functions
    
    /**
     
     */
    internal func completedWorkoutSessions() -> [WorkoutSession] {
        return UserController.sharedInstance.completedWorkoutSessions()
    }
    
}
