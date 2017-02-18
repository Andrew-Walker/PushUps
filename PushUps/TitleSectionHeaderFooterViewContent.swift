//
//  TitleSectionHeaderFooterViewContent.swift
//  PushUps
//
//  Created by Andrew Walker on 17/02/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal final class TitleSectionHeaderFooterViewContent: SectionHeaderFooterViewContent {
    
    // MARK: - Internal Properties
    
    internal let headerFooterViewIdentifier = "TitleSectionHeaderFooterView"
    internal let height: CGFloat = 30.0
    
    internal var text: String
    
    // MARK: - Lifecycle
    
    internal init(text: String) {
        self.text = text
    }
    
}
