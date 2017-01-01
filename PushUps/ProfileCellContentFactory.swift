//
//  ProfileCellContentFactory.swift
//  PushUps
//
//  Created by Andrew Walker on 01/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

internal final class ProfileCellContentFactory {
    
    // MARK: - Lifecycle -
    
    /**
     Restricts ability to create instance. Intended as singleton.
     */
    private init() {}
    
    // MARK: - ProfileCellContentFactory
    
    internal static func createHistorySection(with sessionCount: Int) -> Section {
        let section = Section()
        let headerView = TitleHeaderFooterView(text: "History")
        let content = ProfileCellContentFactory.createSessionCountCellContent(with: sessionCount)
        section.add(content: content)
        section.add(headerView: headerView)
        return section
    }
    
    internal static func createSessionCountCellContent(with sessionCount: Int) -> CellContent {
        let content = SessionCountTappableCellContent(count: sessionCount)
        return content
    }
    
}
