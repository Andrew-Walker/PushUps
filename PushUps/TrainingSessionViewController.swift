//
//  TrainingSessionViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 30/10/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

class TrainingSessionViewController: UIViewController, TrainingSessionViewControllerProxyDelegate {
    
    // MARK: - Properties -
    
    // MARK: Private
    
    @IBOutlet private weak var endButton: SessionButton!
    @IBOutlet private weak var backgroundButton: UIButton!
    @IBOutlet private weak var setsStackView: UIStackView!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    private var activeSet: Set?
    private var proximityController: ProximityController?
    
    // MARK: File Private
    
    @IBOutlet fileprivate weak var counterLabel: UILabel!
    
    fileprivate var timerController: TimerController?
    fileprivate var currentSetCount = 0
    
    // MARK: Internal
    
    internal var proxy: TrainingSessionViewControllerProxy?
    
    // MARK: - Lifecycle -
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        self.proxy = TrainingSessionViewControllerProxy(delegate: self)
        self.proxy?.startSession()
        
        self.proximityController = ProximityController(delegate: self)
        
        self.enableDetection()
        self.styleUI()
        self.configureUI()
    }
    
    // MARK: - UI -
    
    private func styleUI() {
        self.applyBackgroundGradient()
        
        self.endButton.backgroundColor = UIColor.mainBlue()
        self.endButton.setTitle("END SESSION", for: [])
    }
    
    private func configureUI() {
        self.updateSetProgress()
        self.configureSetsStackView()
    }
    
    private func configureSetsStackView() {
        let sets = self.proxy?.activeStageSets() ?? []
        
        for subview in self.setsStackView.arrangedSubviews {
            subview.removeFromSuperview()
        }
        
        for (index, set) in sets.enumerated() {
            let setLabel = UILabel()
            let setPushups = set.pushups
            let setLabelText = String(describing: setPushups)
            setLabel.text = setLabelText
            set.isCurrent ? setLabel.applySetsStackViewActiveStyle() : setLabel.applySetsStackViewStandardStyle()
            
            self.setsStackView.addArrangedSubview(setLabel)
            
            if index != (sets.count - 1) {
                let dividerLabel = UILabel()
                dividerLabel.text = "-"
                dividerLabel.applySetsStackViewStandardStyle()
                
                self.setsStackView.addArrangedSubview(dividerLabel)
            }
        }
    }
    
    // MARK: - Actions -
    
    @IBAction func endButtonTapped(_ sender: AnyObject) {
        self.endSession()
    }
    
    @IBAction func backgroundButtonTapped(_ sender: AnyObject) {
        self.currentSetCount += 1
        self.updateSetProgress()
    }
    
    // MARK: - Private -
    
    private func endSession() {
        self.proxy?.endSession()
        self.timerController?.end()
        self.disableDetection()
        self.dismissToRoot()
    }
    
    private func startInterval() {
        guard let activeSet = self.activeSet else {
            return
        }
        
        self.subtitleLabel.text = "until next set"
        self.timerController = TimerController(interval: activeSet.interval, delegate: self)
        self.timerController?.start()
        self.disableDetection()
    }
    
    private func disableDetection() {
        self.backgroundButton.isEnabled = false
        self.proximityController?.endProximityDetection()
    }
    
    private func enableDetection() {
        self.backgroundButton.isEnabled = true
        self.proximityController?.startProximityDetection()
    }
    
    // MARK: - File Private -
    
    fileprivate func updateSetProgress() {
        guard let activeSet = self.proxy?.activeStageSet() else {
            self.endSession()
            return
        }
        
        self.activeSet = activeSet
        
        let pushupsRequired = activeSet.pushups
        let pushupsComplete = self.currentSetCount
        let pushupsRemaining = pushupsRequired - pushupsComplete
        
        guard pushupsRemaining == 0 else {
            self.counterLabel.text = String(pushupsRemaining)
            return
        }
        
        self.startInterval()
    }
    
    fileprivate func incrementSet() {
        self.subtitleLabel.text = "pushups to go"
        self.currentSetCount = 0
        self.enableDetection()
        self.proxy?.incrementActiveSet()
        self.configureSetsStackView()
        self.updateSetProgress()
    }
    
}

extension TrainingSessionViewController: ProximityControllerDelegate {
    
    // MARK: - Internal -
    
    internal func objectProximityEnded() {
        self.currentSetCount += 1
        self.updateSetProgress()
    }
    
}

extension TrainingSessionViewController: TimerControllerDelegate {
    
    // MARK: - Internal -
    
    internal func timerUpdated() {
        guard let counter = self.timerController?.timeRemaining() else {
            return
        }
        
        self.counterLabel.text = counter.toMinutesSeconds()
    }
    
    internal func timerEnded() {
        self.incrementSet()
    }
    
}
