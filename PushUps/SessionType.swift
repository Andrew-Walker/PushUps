//
//  SessionType.swift
//  PushUps
//
//  Created by Andrew Walker on 11/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

internal protocol SessionType {
    var themeColor: UIColor { get }
    var titleText: String? { get }
    var subtitleText: String { get }
    var startButtonText: String { get }
}

internal class TrainingSessionType: SessionType {
    
    // MARK: - Internal Properties
    
    internal let titleText: String?
    internal let subtitleText = NSLocalizedString("trainingSessionType.trainingLevel", comment: "")
    internal let themeColor = UIColor.mainBlue
    internal let startButtonText = NSLocalizedString("trainingSessionType.startTraining", comment: "").uppercased()
    
    // MARK: - Lifecycle
    
    internal init(titleText: String?) {
        self.titleText = titleText
    }
    
}

internal class WorkoutSessionType: SessionType {
    
    // MARK: - Internal Properties
    
    internal let titleText: String?
    internal let subtitleText = NSLocalizedString("workoutSessionType.personalBest", comment: "")
    internal let themeColor = UIColor.mainPurple
    internal let startButtonText = NSLocalizedString("workoutSessionType.startWorkout", comment: "").uppercased()
    
    // MARK: - Lifecycle
    
    internal init(titleText: String?) {
        self.titleText = titleText
    }
    
}
