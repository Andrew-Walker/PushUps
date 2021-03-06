//
//  SectionHeaderFooterView.swift
//  PushUps
//
//  Created by Andrew Walker on 15/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal protocol SectionHeaderFooterView: class {
    var content: SectionHeaderFooterViewContent? { get set }
    
    func configure(with content: SectionHeaderFooterViewContent)
}
