//
//  CountdownViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 11/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

class CountdownViewController: UIViewController, CountdownViewControllerProxyDelegate {
    
    // MARK: Properties -
    
    // MARK: Private
    
    @IBOutlet private weak var countdownLabel: UILabel!
    @IBOutlet private weak var cancelButton: SessionButton!
    
    private var countdownTimer: Timer?
    private var counter = 5 {
        didSet {
            self.countdownLabel.text = String(self.counter)
        }
    }
    
    // MARK: Public
    
    var proxy: CountdownViewControllerProxy?
    
    // MARK: Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.proxy = CountdownViewControllerProxy(delegate: self)
        
        self.styleUI()
        self.configureUI()
    }
    
    // MARK: UI -
    
    private func styleUI() {
        self.applyBackgroundGradient()
        
        self.cancelButton.backgroundColor = UIColor.mainBlue()
    }
    
    private func configureUI() {
        self.countdownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateCounter), userInfo: nil, repeats: true)
        
        self.cancelButton.setTitle("CANCEL", for: [])
    }
    
    // MARK: Actions -
    
    @objc private func updateCounter() {
        self.counter -= 1
        
        if self.counter <= 0 {
            self.continueToSession()
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: AnyObject) {
        self.countdownTimer?.invalidate()
        self.dismiss(animated: true)
    }
    
    // MARK: Private -
    
    private func continueToSession() {
        self.countdownTimer?.invalidate()
        
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
