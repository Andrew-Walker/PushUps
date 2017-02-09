//
//  HomeWorkoutViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 12/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

internal final class HomeWorkoutViewController: UIViewController, TransitionalViewController,  HomeWorkoutViewControllerProxyDelegate {
    
    // MARK: - Private Properties
    
    @IBOutlet private weak var pushupCountLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var differenceLabel: UILabel!
    
    // MARK: - Internal Properties
    
    internal var proxy: HomeWorkoutViewControllerProxy?
    internal var contentOffsetRange: Range<CGFloat> = 0.0..<0.0
    internal var sessionType: SessionType?
    
    // MARK: - Lifecycle
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        self.proxy = HomeWorkoutViewControllerProxy(delegate: self)
        
        let titleText = self.proxy?.titleString()
        self.sessionType = WorkoutSessionType(titleText: titleText)
        
        self.styleUI()
    }
    
    internal override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.configureUI()
    }
    
    // MARK: - UI
    
    private func styleUI() {
        self.view.backgroundColor = UIColor.clear
    }
    
    private func configureUI() {
        self.pushupCountLabel.text = self.proxy?.mostRecentSessionPushupCount()
        self.differenceLabel.text = self.proxy?.pushUpCountDifference()
        self.durationLabel.text = self.proxy?.mostRecentSessionDuration()        
    }
    
}
