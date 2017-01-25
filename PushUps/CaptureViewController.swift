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
    
    private let photoText = NSLocalizedString("captureViewController.photo", comment: "")
    private let cancelText = NSLocalizedString("general.cancel", comment: "")
    
    private let captureToCapturePreviewMediator = CaptureToCapturePreviewMediator()
    
    // MARK: - File Private Properties
    
    @IBOutlet fileprivate weak var noAccessDescriptionLabel: UILabel!
    @IBOutlet fileprivate weak var noAccessTitleLabel: UILabel!
    @IBOutlet fileprivate weak var noAccessLabelContainerView: UIView!
    
    fileprivate var cameraController: CameraController?
    
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
        guard let image = sender as? UIImage else {
            return
        }
        
        if segue.identifier == String(describing: CapturePreviewViewController.self) {
            let capturePreviewViewController = segue.destination as? CapturePreviewViewController
            capturePreviewViewController?.imageToCapturePreviewMediator = self.captureToCapturePreviewMediator
            self.captureToCapturePreviewMediator.assign(leftViewController: self, rightViewController: capturePreviewViewController)
            self.captureToCapturePreviewMediator.image = image
        }
    }
    
    // MARK: - UI
    
    private func styleUI() {
        self.visualEffectView?.effect = UIBlurEffect(style: .dark)
        self.visualEffectView?.alpha = 0.0
        self.captureTypeLabel?.textColor = UIColor.captureTypeYellow
        self.captureTypeLabel?.text = self.photoText.uppercased()
        self.captureButton?.tintColor = UIColor.white
        
        for maskBorder in self.maskImageViews {
            (maskBorder as? UIImageView)?.tintColor = UIColor.black.withAlphaComponent(0.6)
        }
    }
    
    private func configureUI() {
        self.setNoAccessDescriptionLabel(to: nil)
        self.cancelButton?.titleLabel?.text = self.cancelText
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
    
    fileprivate func setControlsEnabled(to enabled: Bool) {
        self.captureButton.isEnabled = false
        self.switchCameraButton.isEnabled = false
        self.captureTypeLabel?.textColor = UIColor.captureTypeYellow.withAlphaComponent(0.5)
    }
    
}

extension CaptureViewController: CameraControllerDelegate {
    
    // MARK: - Internal Functions
    
    internal func authorizationCompleted(with status: AVAuthorizationStatus) {
        guard status == .authorized else {
            self.setNoAccessDescriptionLabel(to: status.message())
            self.setControlsEnabled(to: false)
            return
        }
        
        self.cameraController?.configure()
    }
    
    internal func captured(image: UIImage) {
        self.performSegue(withIdentifier: String(describing: CapturePreviewViewController.self), sender: image)
    }
    
}
