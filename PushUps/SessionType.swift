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
}

internal class TrainingSessionType: SessionType {
    
    // MARK: - Internal Properties
    
    internal let themeColor = UIColor.mainBlue
    
}

internal class WorkoutSessionType: SessionType {
    
    // MARK: - Internal Properties
    
    internal let themeColor = UIColor.mainPurple
    
}
