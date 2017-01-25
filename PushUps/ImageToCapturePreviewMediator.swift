//
//  ImageToCapturePreviewMediator.swift
//  PushUps
//
//  Created by Andrew Walker on 25/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal protocol ImageToCapturePreviewMediator: Mediator {
    var discardButtonText: String { get }
    var proceedButtonText: String { get }
    var image: UIImage? { get }
}
