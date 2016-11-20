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
    
    // MARK: File Private
    
    fileprivate let imagePicker = UIImagePickerController()
    
    // MARK: Internal
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imagePicker.delegate = self
        self.imagePicker.sourceType = .photoLibrary
        
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
    
    // MARK: - Actions -
    
    @IBAction func profileImageButtonTapped(_ sender: AnyObject) {
        self.presentProfileImageActionSheet()
    }
    
    // MARK: - Private -
    
    @objc private func dismissViewController() {
        self.dismiss(animated: true)
    }
    
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
}

extension ProfileViewController {
    
    // MARK: - Internal -
    
    internal func presentProfileImageActionSheet() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(self.takePhotoAction())
        actionSheet.addAction(self.selectPhotoAction())
        actionSheet.addAction(self.cancelAction())
        self.present(actionSheet, animated: true)
    }
    
    // MARK: - Private -
    
    private func takePhotoAction() -> UIAlertAction {
        let title = NSLocalizedString("profileViewController.takePhotoActionTitle", comment: "")
        let action = UIAlertAction(title: title, style: .default) { (action) in
            
        }
        return action
    }
    
    private func selectPhotoAction() -> UIAlertAction {
        let title = NSLocalizedString("profileViewController.choosePhotoActionTitle", comment: "")
        let action = UIAlertAction(title: title, style: .default) { (action) in
            self.present(self.imagePicker, animated: true)
        }
        return action
    }
    
    private func cancelAction() -> UIAlertAction {
        let title = NSLocalizedString("general.cancel", comment: "")
        let action = UIAlertAction(title: title, style: .cancel)
        return action
    }
    
}
