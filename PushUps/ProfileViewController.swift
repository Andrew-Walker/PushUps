//
//  ProfileViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 10/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

internal final class ProfileViewController: UIViewController, ProfileViewControllerProxyDelegate {
    
    // MARK: - Private Properties
    
    @IBOutlet private weak var profilePictureBackgroundView: UIView!
    @IBOutlet private weak var profilePictureImageView: UIButton!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var settingsButton: UIButton!
    @IBOutlet private weak var shareButton: UIButton!
    
    private let profileToCapturePreviewMediator = ProfileToCapturePreviewMediator()
    
    private var contentController = TableViewContentController()
    
    // MARK: - File Private Properties
    
    fileprivate let imagePickerController = UIImagePickerController()
    
    // MARK: - Internal Properties
    
    internal var proxy: ProfileViewControllerProxy?
    internal var selectedSessionType: SessionType?
    
    // MARK: - Lifecycle
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imagePickerController.delegate = self
        self.imagePickerController.sourceType = .photoLibrary
        
        self.proxy = ProfileViewControllerProxy(delegate: self)
        self.selectedSessionType = self.proxy?.selectedSessionType()
        
        self.styleUI()
        self.configureUI()
        self.configureContent()
    }
    
    internal override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.profilePictureBackgroundView.applyRoundCorners()
        self.profilePictureImageView.applyRoundCorners()
        self.settingsButton.applyRoundCorners()
        self.shareButton.applyRoundCorners()
    }
    
    internal override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let image = sender as? UIImage else {
            return
        }
        
        if segue.identifier == String(describing: CapturePreviewViewController.self) {
            let capturePreviewViewController = segue.destination as? CapturePreviewViewController
            capturePreviewViewController?.imageToCapturePreviewMediator = self.profileToCapturePreviewMediator
            self.profileToCapturePreviewMediator.assign(leftViewController: self, rightViewController: capturePreviewViewController)
            self.profileToCapturePreviewMediator.image = image
        }
    }
    
    // MARK: - UI
    
    private func styleUI() {
        let themeColor = self.selectedSessionType?.themeColor
        self.view.backgroundColor = themeColor
        self.applyBackgroundGradient()
        self.tableView.backgroundColor = UIColor.clear
        self.settingsButton.backgroundColor = UIColor.white.withAlphaComponent(0.35)
        self.settingsButton.tintColor = UIColor.white
        self.shareButton.backgroundColor = UIColor.white.withAlphaComponent(0.35)
        self.shareButton.tintColor = UIColor.white
        self.imagePickerController.applyGlobalStyle()
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
        self.contentController.configure(with: self.tableView, estimatedRowHeight: 67.0)
        self.contentController.hidesAdditionalCells = true
        
        let sessionCount = self.proxy?.numberOfCompletedSessions() ?? 0
        let section = ProfileCellContentFactory.createHistorySection(from: sessionCount)
        self.contentController.add(section: section)
        
        self.contentController.reload()
    }
    
    // MARK: - Actions
    
    @IBAction internal func profileImageButtonTapped(_ sender: AnyObject) {
        self.presentProfileImageActionSheet()
    }
    
    // MARK: - Private Functions
    
    @objc private func dismissViewController() {
        self.dismiss(animated: true)
    }
    
}

internal extension ProfileViewController {
    
    // MARK: - Internal Functions
    
    internal func presentProfileImageActionSheet() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(self.takePhotoAction())
        actionSheet.addAction(self.choosePhotoAction())
        actionSheet.addAction(self.cancelAction())
        self.present(actionSheet, animated: true)
    }
    
    // MARK: - Private Functions
    
    private func takePhotoAction() -> UIAlertAction {
        let takePhotoText = NSLocalizedString("profileViewController.takePhoto", comment: "")
        let action = UIAlertAction(title: takePhotoText, style: .default) { (action) in
            self.performSegue(withIdentifier: String(describing: CaptureViewController.self), sender: nil)
        }
        return action
    }
    
    private func choosePhotoAction() -> UIAlertAction {
        let choosePhotoText = NSLocalizedString("profileViewController.choosePhoto", comment: "")
        let action = UIAlertAction(title: choosePhotoText, style: .default) { (action) in
            self.present(self.imagePickerController, animated: true)
        }
        return action
    }
    
    private func cancelAction() -> UIAlertAction {
        let cancelText = NSLocalizedString("general.cancel", comment: "")
        let action = UIAlertAction(title: cancelText, style: .cancel)
        return action
    }
    
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        guard let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            return
        }
        
        self.dismiss(animated: true)
        self.performSegue(withIdentifier: String(describing: CapturePreviewViewController.self), sender: pickedImage)
    }
    
}
