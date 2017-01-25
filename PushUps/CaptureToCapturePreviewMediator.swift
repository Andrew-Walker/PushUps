//
//  CaptureToCapturePreviewMediator.swift
//  PushUps
//
//  Created by Andrew Walker on 25/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal final class CaptureToCapturePreviewMediator: ImageToCapturePreviewMediator {
    
    // MARK: - Internal Properties
    
    internal var leftViewController: UIViewController?
    internal var rightViewController: UIViewController?
    internal var image: UIImage?
    
    internal var discardButtonText = NSLocalizedString("cameraPreviewViewController.retake", comment: "")
    internal var proceedButtonText = NSLocalizedString("cameraPreviewViewController.usePhoto", comment: "")
    
}
