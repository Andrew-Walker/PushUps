//
//  SectionContent.swift
//  PushUps
//
//  Created by Andrew Walker on 01/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal protocol SectionContent: class {
    var content: [CellContent] { get set }
    var headerView: SectionHeaderFooterView? { get set }
    var footerView: SectionHeaderFooterView? { get set }
}

internal extension SectionContent {
    
    // MARK: - Lifecycle
    
    internal init() {
        self.init()
    }
    
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
