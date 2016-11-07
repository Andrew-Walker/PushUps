//
//  HomePageViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 12/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

protocol HomePageViewControllerDelegate {
    func pageDidChange(toIndex index: Int?)
}

class HomePageViewController: UIPageViewController {
    
    // MARK: Properties -
    
    // MARK: Private
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.pageViewController(name: "Training"),
                self.pageViewController(name: "Workout")]
    }()
    
    // MARK: Internal
    
    internal var pageDelegate: HomePageViewControllerDelegate?
    internal var currentIndex = 0
    
    // MARK: Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        if let firstViewController = self.orderedViewControllers.first {
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // MARK: Private -
    
    private func pageViewController(name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Home\(name)ViewController")
    }
    
    // MARK: Public -
    
    internal func setPage(with index: Int) {
        let viewController = self.orderedViewControllers[index]
        let direction: UIPageViewControllerNavigationDirection = index > self.currentIndex ? .forward : .reverse
        self.setViewControllers([viewController], direction: direction, animated: true, completion: nil)
        self.currentIndex = index
        self.pageDelegate?.pageDidChange(toIndex: index)
    }
    
}

// MARK: UIPageViewControllerDataSource

extension HomePageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = self.orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard self.orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return self.orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = self.orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = self.orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return self.orderedViewControllers[nextIndex]
    }
    
}
