//
//  CountdownViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 11/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

class CountdownViewController: UIViewController {
    
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
    
    // MARK: Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.styleUI()
        self.configureUI()
    }
    
    // MARK: UI -
    
    private func styleUI() {
        self.applyBackground()
        
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
        self.performSegue(withIdentifier: String(SessionViewController), sender: nil)
    }
    
}
