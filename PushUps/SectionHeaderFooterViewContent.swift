//
//  SectionHeaderFooterViewContent.swift
//  PushUps
//
//  Created by Andrew Walker on 17/02/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal protocol SectionHeaderFooterViewContent: class {
    var headerFooterViewIdentifier: String { get }
    var height: CGFloat { get }
}
