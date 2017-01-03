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
    
    private var pageViewController: HomePageViewController?
    
    // MARK: - Internal Properties
    
    @IBOutlet internal weak var segmentedControl: SegmentedControl!
    @IBOutlet internal weak var startButton: SessionButton!
    
    internal let titleView = NavigationBarView.instanceFromNib()
    
    internal var proxy: HomeViewControllerProxy?
    internal var selectedSessionType: SessionType = .Training
    
    // MARK: - Lifecycle
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        self.proxy = HomeViewControllerProxy(delegate: self)
        
        self.styleUI()
        self.configureUI()
    }
    
    internal override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == String(describing: HomePageViewController.self) {
            self.pageViewController = segue.destination as? HomePageViewController
            self.pageViewController?.pageDelegate = self
        }
    }
    
    // MARK: - UI
    
    private func styleUI() {
        self.applyBackgroundGradient()
    }
    
    private func configureUI() {
        self.titleView?.setSubtitleContent(with: "training level")
        self.navigationItem.titleView = self.titleView
        
        let leftNavigationItem = UIBarButtonItem(image: UIImage(named: "profileIcon"), style: .plain, target: self, action: #selector(self.showProfileViewController))
        self.navigationItem.leftBarButtonItem = leftNavigationItem
        
        let rightNavigationItem = UIBarButtonItem(image: UIImage(named: "setsIcon"), style: .plain, target: self, action: #selector(self.showTrainingListViewController))
        self.navigationItem.rightBarButtonItem = rightNavigationItem
        
        self.segmentedControl.addTarget(self, action: #selector(self.segmentedControlChanged), for: .valueChanged)
    }
    
    // MARK: - Actions
    
    @IBAction internal func startButtonTapped(_ sender: AnyObject) {
        let sessionType = self.selectedSessionType
        SessionController.sharedInstance.setActive(sessionType: sessionType)
        
        self.performSegue(withIdentifier: String(describing: CountdownViewController.self), sender: nil)
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
        self.pageViewController?.setPage(with: newIndex)
    }
    
}
