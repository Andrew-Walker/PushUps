//
//  StageCellContent.swift
//  PushUps
//
//  Created by Andrew Walker on 03/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal protocol Selectable: class {
    var isSelected: Bool { get set }
}

internal protocol SelectableSingle: class, Selectable {}

internal protocol SelectableSectionSingle: class, Selectable {}

internal final class StageCellContent: CellContent, SelectableSingle {
    
    // MARK: - Internal Properties
    
    internal let cellIdentifier = "stageCell"
    
    internal var isSelected = false
    internal var stage: Stage
    internal var number: Int
    
    // MARK: - Lifecycle
    
    internal init(stage: Stage, number: Int) {
        self.stage = stage
        self.number = number
    }
    
}
