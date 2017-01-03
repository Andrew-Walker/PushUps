//
//  TimerController.swift
//  PushUps
//
//  Created by Andrew Walker on 20/11/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

internal protocol TimerControllerDelegate {
    func timerUpdated()
    func timerEnded()
}

internal final class TimerController {
    
    // MARK: - Private Properties
    
    private var countdownTimer: Timer?
    private var interval: TimeInterval = 0.0
    private var counter: TimeInterval = 0.0 {
        didSet {
            self.delegate?.timerUpdated()
        }
    }
    
    // MARK: - Internal Properties
    
    internal var delegate: TimerControllerDelegate?
    
    // MARK: - Lifecycle
    
    internal init(interval: TimeInterval, delegate: TimerControllerDelegate) {
        self.interval = interval
        self.delegate = delegate
    }
    
    // MARK: - Private Functions
    
    @objc private func updateCounter() {
        self.counter += 1
        self.checkCompletionStatus()
    }
    
    private func checkCompletionStatus() {
        if self.counter >= self.interval {
            self.endTimer()
        }
    }
    
    private func endTimer() {
        self.delegate?.timerEnded()
        self.end()
    }
    
    // MARK: - Internal Functions
    
    internal func start() {
        self.countdownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateCounter), userInfo: nil, repeats: true)
        self.delegate?.timerUpdated()
        self.checkCompletionStatus()
    }
    
    internal func end() {
        self.countdownTimer?.invalidate()
    }
    
    internal func timeRemaining() -> TimeInterval {
        let interval = self.interval
        let counter = self.counter
        
        return interval - counter
    }
    
    internal func timeCounted() -> TimeInterval {
        return self.counter
    }
    
}
