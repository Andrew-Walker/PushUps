//
//  ProximityController.swift
//  PushUps
//
//  Created by Andrew Walker on 30/10/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

protocol ProximityControllerDelegate {
    func objectProximityDetected()
}

class ProximityController {
    
    // MARK: Properties -
    
    // MARK: Private
    
    private let device = UIDevice.current
    
    // MARK: Public
    
    var delegate: ProximityControllerDelegate?
    
    // MARK: Lifecycle -
    
    init(delegate: ProximityControllerDelegate) {
        self.delegate = delegate
    }
    
    // MARK: Actions -
    
    @objc private func proximityChanged(notification: NSNotification) {
        guard let device = notification.object as? UIDevice else {
            return
        }
        
        if device.proximityState {
            self.delegate?.objectProximityDetected()
        }
    }
    
    // MARK: Private -
    
    private func configureProximitySensor() {
        self.device.isProximityMonitoringEnabled = true
        
        if self.device.isProximityMonitoringEnabled {
            let notificationName = NSNotification.Name.UIDeviceProximityStateDidChange
            NotificationCenter.default.addObserver(self, selector: #selector(self.proximityChanged), name: notificationName, object: self.device)
        }
    }
    
    // MARK: Public -
    
    func startProximityDetection() {
        self.configureProximitySensor()
    }
    
    func endProximityDetection() {
        self.device.isProximityMonitoringEnabled = false
    }
    
}
