//
//  SessionType.swift
//  PushUps
//
//  Created by Andrew Walker on 11/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

enum SessionType: Int {
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
