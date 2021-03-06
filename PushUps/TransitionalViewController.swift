//
//  TransitionalViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 29/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal protocol TransitionalViewController: class {
    var sessionType: SessionType { get }
    var contentOffsetRange: Range<CGFloat> { get set }
    var titleText: String? { get }
    var subtitleText: String { get }
    var startButtonText: String { get }
}
