//
//  HomePageViewController+UIPageViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 02/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

extension HomePageViewController: UIPageViewControllerDelegate {
    
    // MARK: - Internal Functions
    
    internal func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let firstViewController = self.viewControllers?.first, let index = self.orderedViewControllers.index(of: firstViewController) {
            self.currentIndex = index
            self.pageDelegate?.pageDidChange(toIndex: index)
        }
    }
    
}
