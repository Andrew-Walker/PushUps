//
//  TransitionHelper.swift
//  PushUps
//
//  Created by Andrew Walker on 29/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

fileprivate struct TransitionSection {
    let fromColor: UIColor
    let toColor: UIColor
    let contentOffsetRange: ClosedRange<CGFloat>
}

internal final class TransitionHelper {
 
    // MARK: - Private Properties
    
    private var transitionSections = [TransitionSection]()
    
    // MARK: - Internal Properties
    
    internal var viewControllers = [TransitionalViewController]()
    internal var contentSize: CGSize
    
    // MARK: - Lifecycle
    
    internal init(contentSize: CGSize) {
        self.contentSize = contentSize
    }
    
    // MARK: - Internal Functions
    
    internal func add(viewController: TransitionalViewController) {
        self.viewControllers.append(viewController)
    }
    
    internal func color(for contentOffset: CGPoint) -> UIColor? {
        guard let section = self.transitionSections.filter({ $0.contentOffsetRange.contains(contentOffset.x) == true }).first else {
            return nil
        }
        
        let lowerBound = CGFloat(section.contentOffsetRange.lowerBound)
        let upperBound = CGFloat(section.contentOffsetRange.upperBound)
        let percentage = (contentOffset.x - lowerBound) / (upperBound - lowerBound)
        let color = UIColor.composite(color1: section.fromColor, color2: section.toColor, fadePercentage: percentage)
        return color
    }
    
    internal func configure() {
        let backgroundSectionCount = ceil(Double(self.viewControllers.count) / Double(2))
        let backgroundSectionCountInt = Int(backgroundSectionCount)
        for index in 0..<backgroundSectionCountInt {
            let fromColor = self.viewControllers[index].themeColor
            let toColor = self.viewControllers.object(at: index + 1)?.themeColor ?? fromColor
            let contentOffsetRange = self.viewControllers[index].contentOffsetRange
            let transitionSection = TransitionSection(fromColor: fromColor, toColor: toColor, contentOffsetRange: contentOffsetRange)
            self.transitionSections.append(transitionSection)
        }
    }
    
}
