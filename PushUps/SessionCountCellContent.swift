//
//  SessionCountCellContent.swift
//  PushUps
//
//  Created by Andrew Walker on 01/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal final class SessionCountCellContent: CellContent {
    
    // MARK: - Internal Properties
    
    internal let cellIdentifier = "sessionCountCell"
    
    internal var count: Int
    internal var icon = UIImage(named: "historyIcon")
    
    // MARK: - Lifecycle
    
    internal init(count: Int) {
        self.count = count
    }
    
}
