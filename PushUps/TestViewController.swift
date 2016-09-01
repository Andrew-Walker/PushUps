//
//  TestViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 11/07/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit
import HealthKit
import WatchConnectivity

class TestViewController: UIViewController {
    
    @IBOutlet private weak var pushUpCounterLabel: UILabel!
    
    private let healthStore = HKHealthStore()
    
    private var wcSessionActivationCompletion: ((WCSession) -> Void)?
    private var pushUpCount = 0
    private var configuration: HKWorkoutConfiguration?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configuration = HKWorkoutConfiguration()
        self.configuration?.activityType = .coreTraining
        self.configuration?.locationType = .unknown
        
        self.configureProximitySensor()
        self.configureUI()
    }
    
    private func configureUI() {
        self.pushUpCounterLabel.text = String(0)
    }
    
    private func configureProximitySensor() {
        let device = UIDevice.current()
        device.isProximityMonitoringEnabled = true
        
        if device.isProximityMonitoringEnabled {
            NotificationCenter.default().addObserver(self, selector: #selector(proximityChanged), name: "UIDeviceProximityStateDidChangeNotification", object: device)
        }
    }
    
    private func getActiveWCSession(completion: (WCSession) -> Void) {
        guard WCSession.isSupported() else { return }
        
        let wcSession = WCSession.default()
        wcSession.delegate = self
        
        switch wcSession.activationState {
        case .activated:
            completion(wcSession)
        default:
            wcSession.activate()
            self.wcSessionActivationCompletion = completion
        }
    }
    
    @objc private func proximityChanged(notification: NSNotification) {
        guard let device = notification.object as? UIDevice else {
            return
        }
        
        if device.proximityState {
            self.updateCounterLabel()
        }
    }
    
    @IBAction func backgroundButtonTapped(_ sender: AnyObject) {
        self.updateCounterLabel()
    }
    
    @IBAction func openWatchAppButtonTapped(_ sender: AnyObject) {
        guard let workoutConfiguration = self.configuration else { return }
        
        self.getActiveWCSession() { (wcSession) in
            if wcSession.activationState == .activated && wcSession.isWatchAppInstalled {
                self.healthStore.startWatchApp(with: workoutConfiguration, completion: { (success, error) in
                    print(success)
                    print(error)
                })
            }
        }
    }
    
    func updateSessionState(_ state: String) {
        DispatchQueue.main.async {
            print(state)
        }
    }
    
    private func updateCounterLabel() {
        self.pushUpCount += 1
        self.pushUpCounterLabel.text = String(self.pushUpCount)
    }
    
}

// MARK: - WCSessionDelegate

extension TestViewController: WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: NSError?) {
        if activationState == .activated {
            if let activationCompletion = self.wcSessionActivationCompletion {
                activationCompletion(session)
                self.wcSessionActivationCompletion = nil
            }
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : AnyObject]) {
        if let state = message["State"] as? String {
            self.updateSessionState(state)
        }
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
}
