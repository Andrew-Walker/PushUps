//
//  CaptureViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 15/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit
import AVFoundation

internal final class CaptureViewController: UIViewController {
    
    // MARK: - Private Properties
    
    @IBOutlet private weak var captureTypeLabel: UILabel!
    @IBOutlet private weak var previewView: UIView!
    @IBOutlet private weak var previewContainerView: UIView!
    @IBOutlet private weak var switchCameraButton: UIButton!
    @IBOutlet private weak var cancelButton: UIButton!
    @IBOutlet private weak var captureButton: UIButton!
    @IBOutlet private weak var visualEffectView: UIVisualEffectView!
    @IBOutlet private var maskImageViews: NSArray!
    
    // MARK: - File Private Properties
    
    @IBOutlet fileprivate weak var noAccessDescriptionLabel: UILabel!
    @IBOutlet fileprivate weak var noAccessTitleLabel: UILabel!
    @IBOutlet fileprivate weak var noAccessLabelContainerView: UIView!
    
    fileprivate var cameraController: CameraController?
    fileprivate var capturedImage: UIImage?
    
    // MARK: - Lifecycle
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        self.styleUI()
        self.configureUI()
    }
    
    internal override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.animateStatusBarTo(isHidden: true)
    }
    
    internal override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.animateStatusBarTo(isHidden: false)
    }
    
    internal override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.cameraController = CameraController(previewView: self.previewView, delegate: self)
        self.cameraController?.authorizeIfRequired()
    }
    
    internal override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == String(describing: CapturePreviewViewController.self) {
            let capturePreviewViewController = segue.destination as? CapturePreviewViewController
            capturePreviewViewController?.image = self.capturedImage
        }
    }
    
    // MARK: - UI
    
    private func styleUI() {
        self.visualEffectView?.effect = UIBlurEffect(style: .dark)
        self.visualEffectView?.alpha = 0.0
        self.captureTypeLabel?.textColor = UIColor.captureTypeYellow
        self.captureButton?.tintColor = UIColor.white
        
        for maskBorder in maskImageViews {
            (maskBorder as? UIImageView)?.tintColor = UIColor.black.withAlphaComponent(0.6)
        }
    }
    
    private func configureUI() {
        self.setNoAccessDescriptionLabel(to: nil)
        self.cancelButton?.titleLabel?.text = "Cancel"
    }
    
    // MARK: - Actions
    
    @IBAction internal func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func captureButtonTapped(_ sender: Any) {
        self.cameraController?.capture()
    }
    
    // MARK: - File Private Functions
    
    fileprivate func setNoAccessDescriptionLabel(to message: String?) {
        self.noAccessDescriptionLabel.text = message
        self.noAccessLabelContainerView.isHidden = message == nil
    }
    
}

extension CaptureViewController: CameraControllerDelegate {
    
    // MARK: - Internal Functions
    
    internal func authorizationCompleted(with status: AVAuthorizationStatus) {
        guard status == .authorized else {
            self.setNoAccessDescriptionLabel(to: status.message())
            return
        }
        
        self.cameraController?.configure()
    }
    
    internal func captured(image: UIImage) {
        self.capturedImage = image
        self.performSegue(withIdentifier: String(describing: CapturePreviewViewController.self), sender: nil)
    }
    
}
