//
//  LevelSectionContent.swift
//  PushUps
//
//  Created by Andrew Walker on 15/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

internal final class LevelSectionContent: SectionContent {
    
    // MARK: - Internal Properties
    
    internal var content = [CellContent]()
    internal var headerViewContent: SectionHeaderFooterViewContent?
    internal var footerViewContent: SectionHeaderFooterViewContent?
    internal var level: Level
    
    // MARK: - Lifecycle
    
    internal init(level: Level) {
        self.level = level
    }
    
}
