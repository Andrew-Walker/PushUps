//
//  ProximityController.swift
//  PushUps
//
//  Created by Andrew Walker on 30/10/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

internal protocol ProximityControllerDelegate: class {
    func objectProximityEnded()
}

internal final class ProximityController {
    
    // MARK: - Private Properties
    
    private let device = UIDevice.current
    
    private var timeoutTimer = Timer()
    
    // MARK: - Internal Properties
    
    internal weak var delegate: ProximityControllerDelegate?
    internal var isEnabled = false
    
    // MARK: - Lifecycle
    
    internal init(delegate: ProximityControllerDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Private Functions
    
    @objc private func proximityChanged(notification: NSNotification) {
        guard let device = notification.object as? UIDevice else {
            return
        }
        
        guard !device.proximityState && !self.timeoutTimer.isValid else {
            return
        }
        
        self.timeoutTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.invalidateTimeoutTimer), userInfo: nil, repeats: false)
        self.delegate?.objectProximityEnded()
    }
    
    private func configureProximitySensor() {
        self.device.isProximityMonitoringEnabled = true
        
        if self.device.isProximityMonitoringEnabled {
            let notificationName = NSNotification.Name.UIDeviceProximityStateDidChange
            NotificationCenter.default.addObserver(self, selector: #selector(self.proximityChanged), name: notificationName, object: self.device)
        }
    }
    
    @objc private func invalidateTimeoutTimer() {
        self.timeoutTimer.invalidate()
    }
    
    // MARK: - Internal Functions
    
    internal func startProximityDetection() {
        self.configureProximitySensor()
    }
    
    internal func endProximityDetection() {
        self.device.isProximityMonitoringEnabled = false
    }
    
}
