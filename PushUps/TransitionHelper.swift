//
//  TransitionHelper.swift
//  PushUps
//
//  Created by Andrew Walker on 29/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal enum Side {
    case Left
    case Right
}

internal protocol TransitionHelperDelegate: class {
    func update(forColor color: UIColor)
    func update(forNearestIndex index: Int)
    func update(forIndex index: Int)
    func update(forPercentage percentage: CGFloat)
    func update(forBalancedPercentage percentage: CGFloat)
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
    
    // MARK: - Lifecycle
    
    internal init(contentSize: CGSize, delegate: TransitionHelperDelegate) {
        self.contentSize = contentSize
        self.delegate = delegate
    }
    
    // MARK: - Internal Functions
    
    internal func add(viewController: TransitionalViewController) {
        self.viewControllers.append(viewController)
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
    
    internal func getPercentage(for contentOffset: CGPoint) {
        guard let percentage = self.calculatePercentage(for: contentOffset) else {
            return
        }
        
        self.delegate?.update(forPercentage: percentage)
    }
    
    internal func getBalancedPercentage(for contentOffset: CGPoint) {
        guard let percentage = self.calculatePercentage(for: contentOffset) else {
            return
        }
        
        let balancedPercentage = percentage.balanced()
        self.delegate?.update(forBalancedPercentage: balancedPercentage)
    }
    
    internal func getSectionIndex(for contentOffset: CGPoint) {
        guard let index = self.calculateIndex(for: contentOffset) else {
            return
        }
        
        self.delegate?.update(forIndex: index)
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
    
    internal func getNearestIndex(for contentOffset: CGPoint) {
        guard let index = self.calculateNearestIndex(for: contentOffset) else {
            return
        }
        
        self.delegate?.update(forNearestIndex: index)
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
    
    private func calculateIndex(for contentOffset: CGPoint) -> Int? {
        guard let index = self.viewControllers.index(where: { $0.contentOffsetRange.contains(contentOffset.x) }) else {
            return nil
        }
        
        return index
    }
    
    private func calculateNearestIndex(for contentOffset: CGPoint) -> Int? {
        let midPointXContentOffset = contentOffset.x * 2
        guard let index = self.viewControllers.index(where: { $0.contentOffsetRange.contains(midPointXContentOffset) }) else {
            return nil
        }
        
        return index
    }
    
}
