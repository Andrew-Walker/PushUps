//
//  SessionViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 11/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

class SessionViewController: UIViewController, SessionViewControllerProxyDelegate {
    
    // MARK: Properties -
    
    // MARK: Private
    
    @IBOutlet private weak var endButton: SessionButton!
    @IBOutlet private weak var counterLabel: UILabel!
    
    private let device = UIDevice.current
    
    private var pushUpCount = 0
    
    // MARK: Public
    
    var proxy: SessionViewControllerProxy?
    
    // MARK: Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.proxy = SessionViewControllerProxy(delegate: self)
        self.proxy?.startSession()
        
        self.styleUI()
        self.configureProximitySensor()
    }
    
    // MARK: UI -
    
    private func styleUI() {
        self.applyBackgroundGradient()
        
        self.endButton.backgroundColor = UIColor.mainBlue()
        self.endButton.setTitle("END SESSION", for: [])
    }
    
    // MARK: Actions -
    
    @objc private func proximityChanged(notification: NSNotification) {
        guard let device = notification.object as? UIDevice else {
            return
        }
        
        if device.proximityState {
            self.updateCounterLabel()
        }
    }
    
    @IBAction func endButtonTapped(_ sender: AnyObject) {
        self.endSession()
    }
    
    // MARK: Private -
    
    private func configureProximitySensor() {
        self.device.isProximityMonitoringEnabled = true
        
        if self.device.isProximityMonitoringEnabled {
            let notificationName = NSNotification.Name.UIDeviceProximityStateDidChange
            NotificationCenter.default.addObserver(self, selector: #selector(self.proximityChanged), name: notificationName, object: self.device)
        }
    }
    
    private func updateCounterLabel() {
        self.pushUpCount += 1
        self.counterLabel.text = String(self.pushUpCount)
    }
    
    private func endSession() {
        let pushUpCount = self.pushUpCount
        self.proxy?.endSession(withCount: pushUpCount)
        
        self.dismissView()
    }
    
    private func dismissView() {
        self.device.isProximityMonitoringEnabled = false
        
        var viewController = self.presentingViewController
        while let presentingViewController = viewController?.presentingViewController {
            viewController = presentingViewController
        }
        viewController?.dismiss(animated: true, completion: nil)
    }
    
}
