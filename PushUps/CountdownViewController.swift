//
//  CountdownViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 11/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

internal final class CountdownViewController: UIViewController, CountdownViewControllerProxyDelegate {
    
    // MARK: - Private Properties
    
    @IBOutlet private weak var cancelButton: SessionButton!
    
    private var countdownTimer: Timer?
    
    // MARK: - File Private Properties
    
    @IBOutlet fileprivate weak var countdownLabel: UILabel!
    
    fileprivate var timerController: TimerController?
    
    // MARK: - Internal Properties
    
    internal var proxy: CountdownViewControllerProxy?
    
    // MARK: - Lifecycle
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        self.proxy = CountdownViewControllerProxy(delegate: self)
        self.timerController = TimerController(interval: 5.0, delegate: self)
        self.timerController?.start()
        
        self.styleUI()
        self.configureUI()
    }
    
    // MARK: - UI
    
    private func styleUI() {
        self.applyBackgroundGradient()
        
        self.cancelButton.backgroundColor = UIColor.mainBlue
    }
    
    private func configureUI() {
        self.cancelButton.setTitle("CANCEL", for: .normal)
    }
    
    // MARK: - Actions
    
    @IBAction internal func cancelButtonTapped(_ sender: AnyObject) {
        self.timerController?.end()
        self.dismiss(animated: true)
    }
    
    // MARK: - File Private Functions
    
    fileprivate func continueToSession() {
        guard let sessionType = self.proxy?.sessionType() else {
            return
        }
        
        switch sessionType {
        case .Session:
            self.performSegue(withIdentifier: String(describing: WorkoutSessionViewController.self), sender: nil)
        case .Training:
            self.performSegue(withIdentifier: String(describing: TrainingSessionViewController.self), sender: nil)
        }
    }
    
}

extension CountdownViewController: TimerControllerDelegate {
    
    // MARK: - Internal Functions
    
    internal func timerUpdated() {
        guard let counter = self.timerController?.timeRemaining() else {
            return
        }
        
        let counterInt = Int(counter)
        let counterString = String(counterInt)
        self.countdownLabel.text = counterString
    }
    
    internal func timerEnded() {
        self.continueToSession()
    }
    
}
