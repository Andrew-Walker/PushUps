//
//  SessionType.swift
//  PushUps
//
//  Created by Andrew Walker on 11/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

internal protocol SessionTypeTemp {
    var title: String { get }
    var navigationBarSubtitle: String { get }
    var backgroundColor: UIColor { get }
}

internal struct TrainingSessionType: SessionTypeTemp {
    
    // MARK: - Internal Properties
    
    internal let title = "Training"
    internal let navigationBarSubtitle = "training level"
    internal let backgroundColor = UIColor.mainBlue()
    
}

internal struct WorkoutSessionType: SessionTypeTemp {
    
    // MARK: - Internal Properties
    
    internal let title = "Session"
    internal let navigationBarSubtitle = "personal best"
    internal let backgroundColor = UIColor.mainPurple()
    
}

internal enum SessionType: Int {
    case Training
    case Session
    
    func title() -> String {
        switch self {
        case .Training:
            return "TRAINING"
        case .Session:
            return "SESSION"
        }
    }
    
    func navigationBarTitle() -> String {
        switch self {
        case .Training:
            return "Level 2"
        case .Session:
            return "60 Pushups"
        }
    }
    
    func navigationBarSubtitle() -> String {
        switch self {
        case .Training:
            return "training level"
        case .Session:
            return "personal best"
        }
    }
    
    func backgroundColor() -> UIColor {
        switch self {
        case .Training:
            return UIColor.mainBlue()
        case .Session:
            return UIColor.mainPurple()
        }
    }
}
