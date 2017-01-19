//
//  WorkoutSessionViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 11/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

internal final class WorkoutSessionViewController: UIViewController, WorkoutSessionViewControllerProxyDelegate {
    
    // MARK: - Private Properties
    
    @IBOutlet private weak var endButton: SessionButton!
    @IBOutlet private weak var counterLabel: UILabel!
    
    private var pushUpCount = 0
    private var proximityController: ProximityController?
    
    // MARK: - Internal Properties
    
    internal var proxy: WorkoutSessionViewControllerProxy?
    
    // MARK: - Lifecycle
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        self.proxy = WorkoutSessionViewControllerProxy(delegate: self)
        self.proxy?.activateSession()
        
        self.proximityController = ProximityController(delegate: self)
        self.proximityController?.startProximityDetection()
        
        self.styleUI()
    }
    
    // MARK: - UI
    
    private func styleUI() {
        self.applyBackgroundGradient()
        
        self.endButton.backgroundColor = UIColor.mainBlue
        self.endButton.setTitle("END SESSION", for: [])
    }
    
    // MARK: - Actions
    
    @IBAction internal func endButtonTapped(_ sender: AnyObject) {
        self.endSession()
    }
    
    @IBAction internal func backgroundButtonTapped(_ sender: AnyObject) {
        self.updateCounterLabel()
    }
    
    // MARK: - Private Functions
    
    private func endSession() {
        let pushUpCount = self.pushUpCount
        self.proxy?.endSession(with: pushUpCount)
        self.proximityController?.endProximityDetection()
        self.dismissToRoot()
    }
    
    // MARK: - Internal Functions
    
    internal func updateCounterLabel() {
        self.pushUpCount += 1
        self.counterLabel.text = String(self.pushUpCount)
    }
    
}

extension WorkoutSessionViewController: ProximityControllerDelegate {
    
    // MARK: - Internal Functions
    
    internal func objectProximityEnded() {
        self.updateCounterLabel()
    }
    
}
