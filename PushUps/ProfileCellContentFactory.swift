//
//  ProfileCellContentFactory.swift
//  PushUps
//
//  Created by Andrew Walker on 01/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

internal final class ProfileCellContentFactory {
    
    // MARK: - Lifecycle
    
    /**
     Restricts ability to create instance. Intended as singleton.
     */
    private init() {}
    
    // MARK: - Internal Functions
    
    internal static func createHistorySection(from sessionCount: Int) -> Section {
        let section = Section()
        let headerView = TitleHeaderFooterView(text: "History")
        let content = ProfileCellContentFactory.createSessionCountCellContent(from: sessionCount)
        section.add(content: content)
        section.add(headerView: headerView)
        return section
    }
    
    internal static func createSessionCountCellContent(from sessionCount: Int) -> CellContent {
        let content = SessionCountCellContent(count: sessionCount)
        return content
    }
    
}
