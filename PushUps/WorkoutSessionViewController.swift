//
//  WorkoutSessionViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 11/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

class WorkoutSessionViewController: UIViewController, WorkoutSessionViewControllerProxyDelegate {
    
    // MARK: - Properties -
    
    // MARK: Private
    
    @IBOutlet private weak var endButton: SessionButton!
    @IBOutlet private weak var counterLabel: UILabel!
    
    private var pushUpCount = 0
    
    // MARK: Internal
    
    internal var proxy: WorkoutSessionViewControllerProxy?
    internal var proximityController: ProximityController?
    
    // MARK: - Lifecycle -
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        self.proxy = WorkoutSessionViewControllerProxy(delegate: self)
        self.proxy?.activateSession()
        
        self.proximityController = ProximityController(delegate: self)
        self.proximityController?.startProximityDetection()
        
        self.styleUI()
    }
    
    // MARK: - UI -
    
    private func styleUI() {
        self.applyBackgroundGradient()
        
        self.endButton.backgroundColor = UIColor.mainBlue()
        self.endButton.setTitle("END SESSION", for: [])
    }
    
    // MARK: - Actions -
    
    @IBAction func endButtonTapped(_ sender: AnyObject) {
        self.endSession()
    }
    
    // MARK: - Private -
    
    private func endSession() {
        let pushUpCount = self.pushUpCount
        self.proxy?.endSession(with: pushUpCount)
        
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
    
    // MARK: - Internal -
    
    internal func updateCounterLabel() {
        self.pushUpCount += 1
        self.counterLabel.text = String(self.pushUpCount)
    }
    
}

extension WorkoutSessionViewController: ProximityControllerDelegate {
    
    // MARK: - Internal -
    
    internal func objectProximityDetected() {
        self.updateCounterLabel()
    }
    
}
