//
//  ProfileViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 10/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

internal final class ProfileViewController: UIViewController, ProfileViewControllerProxyDelegate {
    
    // MARK: - Properties -
    
    // MARK: Private
    
    @IBOutlet private weak var profilePictureBackgroundView: UIView!
    @IBOutlet private weak var profilePictureImageView: UIButton!
    @IBOutlet private weak var tableView: UITableView!
    
    private var contentController = TableViewContentController()
    
    // MARK: File Private
    
    fileprivate let imagePicker = UIImagePickerController()
    
    // MARK: Internal
    
    internal var proxy: ProfileViewControllerProxy?
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imagePicker.delegate = self
        self.imagePicker.sourceType = .photoLibrary
        
        self.proxy = ProfileViewControllerProxy(delegate: self)
        
        self.styleUI()
        self.configureUI()
        self.configureContent()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.profilePictureBackgroundView.applyRoundCorners()
        self.profilePictureImageView.applyRoundCorners()
    }
    
    // MARK: - UI -
    
    private func styleUI() {
        self.applyBackground()
        
        self.tableView.backgroundColor = UIColor.clear
    }
    
    private func configureUI() {
        let titleView = NavigationBarView.instanceFromNib()
        titleView?.setTitleContent(with: "Andrew Walker")
        titleView?.setSubtitleContent(with: "joined june 2014")
        self.navigationItem.titleView = titleView
        
        let rightNavigationItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.dismissViewController))
        self.navigationItem.rightBarButtonItem = rightNavigationItem
    }
    
    private func configureContent() {
        self.contentController.configure(with: self.tableView, estimatedRowHeight: 66.0)
        self.contentController.hidesAdditionalCells = true
        
        let sessionCount = self.proxy?.numberOfCompletedSessions() ?? 0
        let section = ProfileCellContentFactory.createHistorySection(with: sessionCount)
        self.contentController.add(section: section)
        
        self.contentController.reload()
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

internal extension ProfileViewController {
    
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

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
}
