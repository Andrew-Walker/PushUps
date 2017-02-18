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
    var headerViewContent: SectionHeaderFooterViewContent? { get set }
    var footerViewContent: SectionHeaderFooterViewContent? { get set }
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
    
    internal func add(headerViewContent: SectionHeaderFooterViewContent?) {
        self.headerViewContent = headerViewContent
    }
    
    internal func add(footerViewContent: SectionHeaderFooterViewContent?) {
        self.footerViewContent = footerViewContent
    }
    
}
