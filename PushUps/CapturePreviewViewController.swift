//
//  CapturePreviewViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 22/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal final class CapturePreviewViewController: UIViewController {
 
    // MARK: - Private Properties
    
    @IBOutlet private weak var discardButton: UIButton!
    @IBOutlet private weak var proceedButton: UIButton!
    @IBOutlet private weak var previewImageView: UIImageView!
    @IBOutlet private var maskImageViews: NSArray!
    
    // MARK: - Internal Properties
    
    internal var image: UIImage?
    
    // MARK: - Lifecycle
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureUI()
    }
    
    // MARK: - UI
    
    private func configureUI() {
        self.previewImageView.image = self.image
    }
    
    // MARK: - Actions
    
    @IBAction func discardButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func proceedButtonTapped(_ sender: Any) {
    }
    
}
