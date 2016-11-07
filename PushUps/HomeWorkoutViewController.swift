//
//  HomeWorkoutViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 12/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

class HomeWorkoutViewController: UIViewController, HomeWorkoutViewControllerProxyDelegate {
    
    // MARK: - Properties -
    
    // MARK: Private
    
    @IBOutlet private weak var pushupCountLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var differenceLabel: UILabel!
    
    // MARK: Internal
    
    internal var proxy: HomeWorkoutViewControllerProxy?
    
    // MARK: - Lifecycle -
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        self.proxy = HomeWorkoutViewControllerProxy(delegate: self)
        
        self.styleUI()
    }
    
    internal override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.configureUI()
    }
    
    // MARK: - UI -
    
    private func styleUI() {
        self.view.backgroundColor = UIColor.clear
    }
    
    private func configureUI() {
        let lastSessionPushupCount = self.proxy?.getLastSessionPushupCount() ?? 0
        self.pushupCountLabel.text = String(describing: lastSessionPushupCount)
    }
    
}
