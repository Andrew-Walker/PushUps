//
//  TrainingSessionViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 30/10/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

class TrainingSessionViewController: UIViewController, TrainingSessionViewControllerProxyDelegate {
    
    // MARK: Properties -
    
    // MARK: Private
    
    @IBOutlet private weak var endButton: SessionButton!
    @IBOutlet private weak var counterLabel: UILabel!
    
    // MARK: Public
    
    var proxy: TrainingSessionViewControllerProxy?
    var proximityController: ProximityController?
    
    // MARK: Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.proxy = TrainingSessionViewControllerProxy(delegate: self)
        
        self.proximityController = ProximityController(delegate: self)
        self.proximityController?.startProximityDetection()
        
        self.styleUI()
    }
    
    // MARK: UI -
    
    private func styleUI() {
        self.applyBackgroundGradient()
        
        self.endButton.backgroundColor = UIColor.mainBlue()
        self.endButton.setTitle("END SESSION", for: [])
    }
    
    // MARK: Actions -
    
    @IBAction func endButtonTapped(_ sender: AnyObject) {
        self.endSession()
    }
    
    // MARK: Public -
    
    private func endSession() {
        self.dismissView()
    }
    
    private func dismissView() {
        self.proximityController?.endProximityDetection()
        
        var viewController = self.presentingViewController
        while let presentingViewController = viewController?.presentingViewController {
            viewController = presentingViewController
        }
        viewController?.dismiss(animated: true, completion: nil)
    }
    
}

extension TrainingSessionViewController: ProximityControllerDelegate {
    
    func objectProximityDetected() {
        
    }
    
}
