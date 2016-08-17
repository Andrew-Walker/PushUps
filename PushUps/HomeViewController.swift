//
//  HomeViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 04/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: Properties -
    
    // MARK: Private
    
    @IBOutlet private weak var startButton: SessionButton!
    @IBOutlet private weak var segmentedControl: SegmentedControl!
    
    private let titleView = NavigationBarView.instanceFromNib()
    
    private var pageViewController: HomePageViewController?
    
    // MARK: Public
    
    // MARK: Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.styleUI()
        self.configureUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == String(HomePageViewController) {
            self.pageViewController = segue.destinationViewController as? HomePageViewController
            self.pageViewController?.pageDelegate = self
        }
    }
    
    // MARK: UI -
    
    private func styleUI() {
        self.applyBackgroundGradient()
    }
    
    private func configureUI() {
        self.titleView?.setTitleContent(withText: "Level 2")
        self.titleView?.setSubtitleContent(withText: "training level")
        self.navigationItem.titleView = titleView
        
        let leftNavigationItem = UIBarButtonItem(image: UIImage(named: "profileIcon"), style: .plain, target: self, action: #selector(self.showProfileViewController))
        self.navigationItem.leftBarButtonItem = leftNavigationItem
        
        let rightNavigationItem = UIBarButtonItem(image: UIImage(named: "setsIcon"), style: .plain, target: self, action: #selector(self.showTrainingListViewController))
        self.navigationItem.rightBarButtonItem = rightNavigationItem
        
        self.segmentedControl.addTarget(self, action: #selector(self.segmentedControlChanged), for: .valueChanged)
    }
    
    // MARK: Actions -
    
    @objc private func showProfileViewController() {
        self.performSegue(withIdentifier: String(ProfileViewController), sender: nil)
    }
    
    @objc private func showTrainingListViewController() {
        self.performSegue(withIdentifier: String(TrainingListViewController), sender: nil)
    }
    
    @objc private func segmentedControlChanged() {
        let newIndex = self.segmentedControl.selectedIndex
        self.pageViewController?.setPage(withIndex: newIndex)
    }
    
}

extension HomeViewController: HomePageViewControllerDelegate {
    
    func pageDidChange(toIndex index: Int?) {
        self.updateView(forPageIndex: index)
    }
    
    private func updateView(forPageIndex index: Int?) {
        guard let index = index, sessionType = SessionType(rawValue: index) else {
            return
        }
        
        self.view.backgroundColor = sessionType.backgroundColor()
        self.startButton.backgroundColor = sessionType.backgroundColor()
        self.startButton.setTitle(sessionType.title(), for: [])
        self.segmentedControl.selectedIndex = index
        self.segmentedControl.selectedLabelColor = sessionType.backgroundColor()
        self.titleView?.setTitleContent(withText: sessionType.navigationBarTitle())
        self.titleView?.setSubtitleContent(withText: sessionType.navigationBarSubtitle())
    }
    
}
