//
//  ContentController.swift
//  PushUps
//
//  Created by Andrew Walker on 01/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal protocol ContentController {
    var sections: [SectionContent] { get set }
    
    func reload()
    func numberOfSections() -> Int
    func numberOfItems(in section: Int) -> Int
    func cellIdentifier(for indexPath: IndexPath) -> String
    mutating func add(section: SectionContent)
    mutating func removeAllContent()
}

internal extension ContentController {
    
    // MARK: - Internal Functions
    
    internal func numberOfSections() -> Int {
        return self.sections.count
    }
    
    internal func numberOfItems(in section: Int) -> Int {
        return self.sections[section].content.count
    }
    
    internal func cellIdentifier(for indexPath: IndexPath) -> String {
        return self.sections[indexPath.section].content[indexPath.row].cellIdentifier
    }
    
    internal func content(for indexPath: IndexPath) -> CellContent {
        return self.sections[indexPath.section].content[indexPath.row]
    }
    
    internal mutating func removeAllContent() {
        self.sections.removeAll()
    }
    
    internal mutating func add(section: SectionContent) {
        self.sections.append(section)
    }
    
    internal mutating func add(sections: [SectionContent]) {
        self.sections.append(contentsOf: sections)
    }
    
    internal func selectedContent() -> [Selectable] {
        let selectableContent = self.sections.flatMap({ $0.content.flatMap({ $0 as? Selectable }) })
        let selectedContent = selectableContent.filter({ $0.isSelected })
        return selectedContent
    }
    
    internal func selectedContentSections() -> [SectionContent] {
        let selectableContent = self.sections.filter({ $0.content.contains(where: { ($0 as? Selectable)?.isSelected == true }) })
        return selectableContent
    }
    
}
