//
//  StageCellContent.swift
//  PushUps
//
//  Created by Andrew Walker on 03/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal final class StageCellContent: CellContent {
    
    // MARK: - Internal Properties
    
    internal let cellIdentifier = "stageCell"
    
    internal var stage: Stage
    internal var number: Int
    
    // MARK: - Lifecycle
    
    internal init(stage: Stage, number: Int) {
        self.stage = stage
        self.number = number
    }
    
}
