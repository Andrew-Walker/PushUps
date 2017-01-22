//
//  CameraController.swift
//  PushUps
//
//  Created by Andrew Walker on 15/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import AVFoundation
import UIKit

internal protocol CameraControllerDelegate: class {
    func authorizationCompleted(with status: AVAuthorizationStatus)
    func captured(image: UIImage)
}

internal final class CameraController: NSObject {
    
    // MARK: - Private Properties
    
    private let captureSession = AVCaptureSession()
    private let imageOutput = AVCapturePhotoOutput()
    
    private weak var previewView: UIView?
    
    // MARK: - File Private Properties
    
    fileprivate weak var delegate: CameraControllerDelegate?
    
    // MARK: - Internal Properties
    
    internal var captureDevicePosition: AVCaptureDevicePosition = .front
    
    // MARK: - Lifecycle
    
    internal init(previewView: UIView, delegate: CameraControllerDelegate) {
        self.previewView = previewView
        self.delegate = delegate
    }
    
    // MARK: - Internal Functions
    
    internal func authorizeIfRequired() {
        let authorizationStatus = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
        
        switch authorizationStatus {
        case .authorized, .restricted, .denied:
            self.delegate?.authorizationCompleted(with: authorizationStatus)
        case .notDetermined:
            self.requestCameraAuthorization()
        }
    }
    
    internal func configure() {
        guard !self.captureSession.isRunning else {
            return
        }
        
        guard let captureDevice = self.getCurrentCaptureDevice() else {
            return
        }
        
        do {
            try self.setInput(to: captureDevice)
        } catch {
            return
        }
        
        guard let previewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession), let previewView = self.previewView else {
            return
        }
        
        previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        previewLayer.frame = previewView.layer.bounds
        previewLayer.removeFromSuperlayer()
        previewView.layer.addSublayer(previewLayer)
        
        self.setOutput()
        self.captureSession.startRunning()
    }
    
    internal func capture() {
        guard let connection = self.imageOutput.connection(withMediaType: AVMediaTypeVideo) else {
            return
        }
        
        connection.videoOrientation = .landscapeLeft
        
        let settings = AVCapturePhotoSettings()
        self.imageOutput.capturePhoto(with: settings, delegate: self)
    }
    
    // MARK: - Private Functions
    
    private func requestCameraAuthorization() {
        AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo, completionHandler: { (granted) in
            self.authorizeIfRequired()
        })
    }
    
    private func getCurrentCaptureDevice() -> AVCaptureDevice? {
        let deviceTypes: [AVCaptureDeviceType] = [.builtInWideAngleCamera]
        let mediaType = AVMediaTypeVideo
        let position: AVCaptureDevicePosition = .unspecified
        guard let discoverSession = AVCaptureDeviceDiscoverySession.init(deviceTypes: deviceTypes, mediaType: mediaType, position: position) else {
            return nil
        }
        
        let captureDevice = discoverSession.devices.filter({ $0.position == self.captureDevicePosition }).first
        return captureDevice
    }
    
    private func setOutput() {
        let cameraDeviceOutput = self.imageOutput
        guard self.captureSession.canAddOutput(cameraDeviceOutput) else {
            return
        }
        
        self.captureSession.addOutput(cameraDeviceOutput)
    }
    
    private func setInput(to device: AVCaptureDevice) throws {
        let captureDeviceInput = try AVCaptureDeviceInput(device: device)
        guard self.captureSession.canAddInput(captureDeviceInput) else {
            return
        }
        
        self.removeAllInputs()
        self.captureSession.addInput(captureDeviceInput)
    }
    
    private func removeAllInputs() {
        for input in self.captureSession.inputs {
            let input = input as? AVCaptureDeviceInput
            self.captureSession.removeInput(input)
        }
    }
    
}

extension CameraController: AVCapturePhotoCaptureDelegate {
    
    // MARK: - Internal Functions
    
    internal func capture(_ captureOutput: AVCapturePhotoOutput, didFinishProcessingPhotoSampleBuffer photoSampleBuffer: CMSampleBuffer?, previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
        guard let photoSampleBuffer = photoSampleBuffer else {
            return
        }
        
        guard let imageData = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: photoSampleBuffer, previewPhotoSampleBuffer: nil) else {
            return
        }
        
        guard let image = UIImage(data: imageData) else {
            return
        }
        
        let flippedImage = image.flipHorizontally()
        self.delegate?.captured(image: flippedImage)
    }
    
}
