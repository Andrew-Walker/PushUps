//
//  ProfileViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 10/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Properties -
    
    // MARK: Private
    
    @IBOutlet private weak var profilePictureBackgroundView: UIView!
    @IBOutlet private weak var profilePictureImageView: UIButton!
    
    // MARK: Internal
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.styleUI()
        self.configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.profilePictureBackgroundView.applyRoundCorners()
        self.profilePictureImageView.applyRoundCorners()
    }
    
    // MARK: - UI -
    
    private func styleUI() {
        self.applyBackground()
    }
    
    private func configureUI() {
        let titleView = NavigationBarView.instanceFromNib()
        titleView?.setTitleContent(with: "Andrew Walker")
        titleView?.setSubtitleContent(with: "joined june 2014")
        self.navigationItem.titleView = titleView
        
        let rightNavigationItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.dismissViewController))
        self.navigationItem.rightBarButtonItem = rightNavigationItem
    }
    
    // MARK: - Private -
    
    @objc private func dismissViewController() {
        self.dismiss(animated: true)
    }
    
}
