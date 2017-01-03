//
//  ContentController.swift
//  PushUps
//
//  Created by Andrew Walker on 01/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal protocol ContentController {
    var sections: [Section] { get set }
    
    func reload()
    func numberOfSections() -> Int
    func numberOfItems(in section: Int) -> Int
    func cellIdentifier(for indexPath: IndexPath) -> String
    mutating func add(section: Section)
    mutating func removeAllContent()
}

internal extension ContentController {
    
    // MARK: - Internal -
    
    internal func numberOfSections() -> Int {
        return self.sections.count
    }
    
    internal func numberOfItems(in section: Int) -> Int {
        return self.sections[section].content.count
    }
    
    internal func cellIdentifier(for indexPath: IndexPath) -> String {
        return self.sections[indexPath.section].content[indexPath.row].cellIdentifier
    }
    
    internal mutating func removeAllContent() {
        self.sections.removeAll()
    }
    
    internal mutating func add(section: Section) {
        self.sections.append(section)
    }
    
    internal mutating func add(sections: [Section]) {
        self.sections.append(contentsOf: sections)
    }
    
}
