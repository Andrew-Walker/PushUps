//
//  HomeViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 04/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, HomeViewControllerProxyDelegate {
    
    // MARK: Properties -
    
    // MARK: Private
    
    private var pageViewController: HomePageViewController?
    
    // MARK: Public
    
    @IBOutlet weak var segmentedControl: SegmentedControl!
    @IBOutlet weak var startButton: SessionButton!
    
    let titleView = NavigationBarView.instanceFromNib()
    
    var proxy: HomeViewControllerProxy?
    var selectedSessionType: SessionType = .Training
    
    // MARK: Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.proxy = HomeViewControllerProxy(delegate: self)
        
        self.styleUI()
        self.configureUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == String(describing: HomePageViewController.self) {
            self.pageViewController = segue.destination as? HomePageViewController
            self.pageViewController?.pageDelegate = self
        }
    }
    
    // MARK: UI -
    
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
    
    // MARK: Actions -
    
    @IBAction func startButtonTapped(_ sender: AnyObject) {
        let sessionType = self.selectedSessionType
        SessionController.sharedInstance.set(sessionType: sessionType)
        
        self.performSegue(withIdentifier: String(describing: CountdownViewController.self), sender: nil)
    }
    
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
