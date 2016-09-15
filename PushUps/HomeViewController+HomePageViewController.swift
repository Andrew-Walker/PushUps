//
//  HomeViewController+HomePageViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 02/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

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
        self.startButton.setTitle("START \(sessionType.title())", for: [])
        self.segmentedControl.selectedIndex = index
        self.segmentedControl.selectedLabelColor = sessionType.backgroundColor()
        self.titleView?.setTitleContent(withText: sessionType.navigationBarTitle())
        self.titleView?.setSubtitleContent(withText: sessionType.navigationBarSubtitle())
        self.selectedSessionType = sessionType
    }
    
}
