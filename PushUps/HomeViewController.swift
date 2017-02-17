//
//  HomeViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 04/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

internal final class HomeViewController: UIViewController, HomeViewControllerProxyDelegate {
    
    // MARK: - Private Properties
    
    @IBOutlet private weak var scrollView: UIScrollView!
    
    // MARK: - File Private Properties
    
    fileprivate var transitionHelper: TransitionHelper?
    fileprivate var viewControllers = [UIViewController]()
    
    // MARK: - Internal Properties
    
    @IBOutlet internal weak var segmentedControl: SegmentedControl!
    @IBOutlet internal weak var startButton: SessionButton!
    
    internal let titleView = NavigationBarView.instanceFromNib()
    
    internal var proxy: HomeViewControllerProxy?
    internal var selectedSessionType: SessionType?
    
    // MARK: - Lifecycle
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        self.proxy = HomeViewControllerProxy(delegate: self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeTrainingViewController = storyboard.instantiateViewController(withIdentifier: String(describing: HomeTrainingViewController.self))
        self.viewControllers.append(homeTrainingViewController)
        let homeWorkoutViewController = storyboard.instantiateViewController(withIdentifier: String(describing: HomeWorkoutViewController.self))
        self.viewControllers.append(homeWorkoutViewController)
        
        self.styleUI()
        self.configureUI()
    }
    
    internal override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.transitionHelper == nil ? self.configureTransitionalViewControllers() : self.updateTransitionalViewControllers()
    }
    
    // MARK: - UI
    
    private func styleUI() {
        self.applyBackgroundGradient()
        self.startButton.alpha = 0.0
        self.titleView?.alpha = 0.0
    }
    
    private func configureUI() {
        self.navigationItem.titleView = self.titleView
        self.segmentedControl.addTarget(self, action: #selector(self.segmentedControlChanged), for: .valueChanged)
        self.scrollView.isPagingEnabled = true
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.delegate = self
        
        let leftNavigationItemImage = UIImage(named: "profileIcon")
        let leftNavigationItem = UIBarButtonItem(image: leftNavigationItemImage, style: .plain, target: self, action: #selector(self.showProfileViewController))
        self.navigationItem.leftBarButtonItem = leftNavigationItem
        
        let rightNavigationItemImage = UIImage(named: "setsIcon")
        let rightNavigationItem = UIBarButtonItem(image: rightNavigationItemImage, style: .plain, target: self, action: #selector(self.showTrainingListViewController))
        self.navigationItem.rightBarButtonItem = rightNavigationItem
    }
    
    private func configureTransitionalViewControllers() {
        let viewControllers = self.viewControllers
        let scrollViewFrame = self.scrollView.frame
        
        let contentHeight = scrollViewFrame.height
        let contentWidth = scrollViewFrame.width * CGFloat(viewControllers.count)
        let contentSize = CGSize(width: contentWidth, height: contentHeight)
        
        self.scrollView.contentSize = contentSize
        self.transitionHelper = TransitionHelper(contentSize: contentSize, delegate: self)
        
        for (index, viewController) in viewControllers.enumerated() {
            let xOrigin = scrollViewFrame.width * CGFloat(index)
            let yOrigin = CGFloat(0.0)
            let origin = CGPoint(x: xOrigin, y: yOrigin)
            let size = CGSize(width: scrollViewFrame.width, height: scrollViewFrame.height)
            viewController.view.frame = CGRect(origin: origin, size: size)
            (viewController as? TransitionalViewController)?.contentOffsetRange = xOrigin..<(xOrigin + scrollViewFrame.width)
            self.addChildViewController(viewController)
            self.scrollView.addSubview(viewController.view)
            viewController.didMove(toParentViewController: self)
            self.configure(viewController: viewController)
        }
        
        self.transitionHelper?.configure()
        self.animateContentAppearance()
    }
    
    private func configure(viewController: UIViewController) {
        guard let transitionalViewController = viewController as? TransitionalViewController else {
            return
        }
        
        self.transitionHelper?.add(viewController: transitionalViewController)
    }
    
    private func updateTransitionalViewControllers() {
        guard let index = self.transitionHelper?.nearestIndex else {
            return
        }
        
        self.update(forNearestIndex: index, shouldUpdate: true)
    }
    
    private func animateContentAppearance() {
        let defaultContentOffset = CGPoint(x: 0.0, y: 0.0)
        self.getContent(for: defaultContentOffset, shouldUpdateIndex: true)
        
        self.scrollView?.fadeIn()
        self.startButton.fadeIn()
        self.titleView?.fadeIn()
    }
    
    // MARK: - Actions
    
    @IBAction internal func startButtonTapped(_ sender: AnyObject) {
        self.performSegue(withIdentifier: String(describing: CountdownViewController.self), sender: nil)
    }
    
    // MARK: - File Private Functions
    
    fileprivate func getContent(for contentOffset: CGPoint, shouldUpdateIndex: Bool) {
        self.transitionHelper?.getColor(for: contentOffset)
        self.transitionHelper?.getBalancedPercentage(for: contentOffset)
        self.transitionHelper?.getNearestIndex(for: contentOffset, shouldUpdate: shouldUpdateIndex)
    }
    
    // MARK: - Private Functions
    
    @objc private func showProfileViewController() {
        self.performSegue(withIdentifier: String(describing: ProfileViewController.self), sender: nil)
    }
    
    @objc private func showTrainingListViewController() {
        self.performSegue(withIdentifier: String(describing: TrainingListViewController.self), sender: nil)
    }
    
    @objc private func segmentedControlChanged() {
        let newIndex = self.segmentedControl.selectedIndex
        let contentOffsetX = self.transitionHelper?.contentOffset(for: newIndex) ?? 0.0
        let rect = CGRect(x: contentOffsetX, y: 0.0, width: 320.0, height: 454.0)
        self.scrollView.scrollRectToVisible(rect, animated: true)
    }
    
}

extension HomeViewController: UIScrollViewDelegate {
    
    // MARK: - Internal Functions
    
    internal func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset
        let shouldUpdateIndex = scrollView.isDragging
        self.getContent(for: contentOffset, shouldUpdateIndex: shouldUpdateIndex)
    }
    
    internal func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset
        self.getContent(for: contentOffset, shouldUpdateIndex: true)
    }
    
    internal func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset
        self.getContent(for: contentOffset, shouldUpdateIndex: true)
    }
    
}

extension HomeViewController: TransitionHelperDelegate {
    
    // MARK: - Internal Functions
    
    internal func update(forColor color: UIColor) {
        self.view.backgroundColor = color
        self.startButton.backgroundColor = color
        self.segmentedControl.selectedLabelColor = color
    }
    
    internal func update(forNearestIndex index: Int, shouldUpdate: Bool) {
        guard let selectedViewController = self.viewControllers[index] as? TransitionalViewController else {
            return
        }
        
        let selectedSessionType = selectedViewController.sessionType
        
        if shouldUpdate {
            self.segmentedControl.selectedIndex = index
        }
        
        SessionController.sharedInstance.setSelected(sessionType: selectedSessionType)
        self.titleView?.setTitleContent(with: selectedViewController.titleText)
        self.titleView?.setSubtitleContent(with: selectedViewController.subtitleText)
        self.startButton.setTitle(selectedViewController.startButtonText, for: .normal)
        self.selectedSessionType = selectedSessionType
    }
    
    internal func update(forBalancedPercentage percentage: CGFloat) {
        self.startButton.alpha = percentage
        self.titleView?.alpha = percentage
    }
    
}
