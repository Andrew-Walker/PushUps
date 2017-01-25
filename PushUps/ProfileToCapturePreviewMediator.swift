//
//  ProfileToCapturePreviewMediator.swift
//  PushUps
//
//  Created by Andrew Walker on 25/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal final class ProfileToCapturePreviewMediator: ImageToCapturePreviewMediator {
    
    // MARK: - Internal Properties
    
    internal var leftViewController: UIViewController?
    internal var rightViewController: UIViewController?
    internal var image: UIImage?
    
    internal var discardButtonText = NSLocalizedString("general.cancel", comment: "")
    internal var proceedButtonText = NSLocalizedString("cameraPreviewViewController.choose", comment: "")
    
}
