//
//  TransitionHelper.swift
//  PushUps
//
//  Created by Andrew Walker on 29/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal protocol TransitionHelperDelegate: class {
    func update(forColor color: UIColor)
    func update(forNearestIndex index: Int, shouldUpdate: Bool)
    func update(forBalancedPercentage percentage: CGFloat)
    func update(forOverallPercentage percentage: CGFloat)
}

fileprivate struct TransitionSection {
    let fromColor: UIColor
    let toColor: UIColor
    let contentOffsetRange: Range<CGFloat>
}

internal final class TransitionHelper {
 
    // MARK: - Private Properties
    
    private var transitionSections = [TransitionSection]()
    private var delegate: TransitionHelperDelegate?
    
    // MARK: - Internal Properties
    
    internal var viewControllers = [TransitionalViewController]()
    internal var contentSize: CGSize
    internal var nearestIndex = 0
    
    // MARK: - Lifecycle
    
    internal init(contentSize: CGSize, delegate: TransitionHelperDelegate) {
        self.contentSize = contentSize
        self.delegate = delegate
    }
    
    // MARK: - Internal Functions
    
    internal func configure() {
        let backgroundSectionCount = ceil(Double(self.viewControllers.count) / Double(2))
        let backgroundSectionCountInt = Int(backgroundSectionCount)
        for index in 0..<backgroundSectionCountInt {
            let defaultColor = UIColor.mainBlue
            let fromColor = self.viewControllers[index].sessionType?.themeColor ?? defaultColor
            let toColor = self.viewControllers.object(at: index + 1)?.sessionType?.themeColor ?? defaultColor
            let contentOffsetRange = self.viewControllers[index].contentOffsetRange
            let transitionSection = TransitionSection(fromColor: fromColor, toColor: toColor, contentOffsetRange: contentOffsetRange)
            self.transitionSections.append(transitionSection)
        }        
    }
    
    internal func add(viewController: TransitionalViewController) {
        self.viewControllers.append(viewController)
    }
    
    internal func contentOffset(for index: Int) -> CGFloat {
        return self.viewControllers[index].contentOffsetRange.lowerBound
    }
    
    internal func getBalancedPercentage(for contentOffset: CGPoint) {
        guard let percentage = self.calculatePercentage(for: contentOffset) else {
            return
        }
        
        let balancedPercentage = percentage.balanced()
        self.delegate?.update(forBalancedPercentage: balancedPercentage)
    }
    
    internal func getOverallPercentage(for contentOffset: CGPoint) {
        let overallPercentage = self.calculateOverallPercentage(for: contentOffset)
        self.delegate?.update(forOverallPercentage: overallPercentage)
    }
    
    internal func getColor(for contentOffset: CGPoint) {
        guard let section = self.transitionSections.filter({ $0.contentOffsetRange.contains(contentOffset.x) }).first else {
            return
        }
        
        guard let percentage = self.calculatePercentage(for: contentOffset) else {
            return
        }
        
        let color = UIColor.composite(color1: section.fromColor, color2: section.toColor, fadePercentage: percentage)
        self.delegate?.update(forColor: color)
    }
    
    internal func getNearestIndex(for contentOffset: CGPoint, shouldUpdate: Bool) {
        guard let index = self.calculateNearestIndex(for: contentOffset) else {
            return
        }
        
        self.nearestIndex = index
        self.delegate?.update(forNearestIndex: index, shouldUpdate: shouldUpdate)
    }
    
    // MARK: - Private Functions
    
    private func calculatePercentage(for contentOffset: CGPoint) -> CGFloat? {
        guard let section = self.transitionSections.filter({ $0.contentOffsetRange.contains(contentOffset.x) }).first else {
            return nil
        }
        
        let lowerBound = CGFloat(section.contentOffsetRange.lowerBound)
        let upperBound = CGFloat(section.contentOffsetRange.upperBound)
        let percentage = (contentOffset.x - lowerBound) / (upperBound - lowerBound)
        return percentage
    }
    
    private func calculateOverallPercentage(for contentOffset: CGPoint) -> CGFloat {
        return contentOffset.x / self.contentSize.width
    }
    
    private func calculateNearestIndex(for contentOffset: CGPoint) -> Int? {
        let midPointXContentOffset = contentOffset.x * 2
        guard let index = self.viewControllers.index(where: { $0.contentOffsetRange.contains(midPointXContentOffset) }) else {
            return nil
        }
        
        return index
    }
    
}
