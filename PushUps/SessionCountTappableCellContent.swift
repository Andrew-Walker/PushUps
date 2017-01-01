//
//  SessionHistoryTappableCellContent.swift
//  PushUps
//
//  Created by Andrew Walker on 01/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal final class SessionCountTappableCellContent: CellContent {
    
    // MARK: - Properties -
    
    // MARK: Internal
    
    internal let cellIdentifier = "sessionCountTappableCell"
    
    internal var count: Int
    internal var icon = UIImage(named: "historyIcon")
    
    // MARK: - Lifecycle
    
    internal init(count: Int) {
        self.count = count
    }
    
}
