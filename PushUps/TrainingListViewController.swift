//
//  TrainingListViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 11/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

internal final class TrainingListViewController: UIViewController {
    
    // MARK: - Properties -
    
    // MARK: Private
    
    // MARK: Internal
    
    // MARK: - Lifecycle -
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        self.styleUI()
        self.configureUI()
    }
    
    // MARK: - UI -
    
    private func styleUI() {
        
    }
    
    private func configureUI() {
        let rightNavigationItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.dismissViewController))
        self.navigationItem.rightBarButtonItem = rightNavigationItem
    }
    
    // MARK: - Private -
    
    @objc private func dismissViewController() {
        self.dismiss(animated: true)
    }
    
}
