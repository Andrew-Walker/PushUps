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
    
    @IBOutlet fileprivate weak var noAccessLabel: UILabel!
    
    fileprivate var cameraController: CameraController?
    
    // MARK: - Lifecycle
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cameraController = CameraController(previewView: self.previewView, delegate: self)
        self.cameraController?.authorizeIfRequired()
        
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
        self.noAccessLabel?.isHidden = true
        self.noAccessLabel?.text = "Unable to connect to camera\n\nPlease allow access to the camera from your device settings."
        self.cancelButton?.titleLabel?.text = "Cancel"
    }
    
    // MARK: - Actions
    
    @IBAction internal func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func captureButtonTapped(_ sender: Any) {
        self.cameraController?.capture()
    }
    
}

extension CaptureViewController: CameraControllerAuthorizationDelegate {
    
    // MARK: - Internal Functions
    
    internal func authorizationCompleted(with status: AVAuthorizationStatus) {
        guard status == .authorized else {
            self.noAccessLabel.text = status.message()
            return
        }
        
        self.cameraController?.configure()
    }
    
}
