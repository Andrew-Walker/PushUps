//
//  Section.swift
//  PushUps
//
//  Created by Andrew Walker on 01/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal protocol SectionHeaderFooterView: class {
    var height: CGFloat { get set }
}

internal final class Section {
    
    // MARK: - Internal Properties
    
    internal var content = [CellContent]()
    internal var headerView: SectionHeaderFooterView?
    internal var footerView: SectionHeaderFooterView?
    
    // MARK: - Internal Functions
    
    internal func add(content: CellContent) {
        self.content.append(content)
    }
    
    internal func add(headerView: SectionHeaderFooterView?) {
        self.headerView = headerView
    }
    
    internal func add(footerView: SectionHeaderFooterView?) {
        self.footerView = footerView
    }
    
}
