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
    @IBOutlet private weak var setsStackView: UIStackView!
    
    // MARK: File Private
    
    @IBOutlet fileprivate weak var counterLabel: UILabel!
    
    fileprivate var currentSetCount = 0
    
    // MARK: Internal
    
    internal var proxy: TrainingSessionViewControllerProxy?
    internal var proximityController: ProximityController?
    
    // MARK: - Lifecycle -
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        self.proxy = TrainingSessionViewControllerProxy(delegate: self)
        self.proxy?.startSession()
        
        self.proximityController = ProximityController(delegate: self)
        self.proximityController?.startProximityDetection()
        
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
        self.updateUI()
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
    
    // MARK: - Private -
    
    private func endSession() {
        self.dismissView()
    }
    
    private func dismissView() {
        self.proximityController?.endProximityDetection()
        
        var viewController = self.presentingViewController
        while let presentingViewController = viewController?.presentingViewController {
            viewController = presentingViewController
        }
        viewController?.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - File Private -
    
    fileprivate func updateUI() {
        guard let activeSet = self.proxy?.activeStageSet() else {
            return
        }
        
        let pushupsRequired = activeSet.pushups
        let pushupsComplete = self.currentSetCount
        let pushupsRemaining = pushupsRequired - pushupsComplete
        
        guard pushupsRemaining == 0 else {
            self.counterLabel.text = String(pushupsRemaining)
            return
        }
        
        self.currentSetCount = 0
        self.proxy?.incrementActiveSet()
        self.configureSetsStackView()
        self.updateUI()
    }
    
}

extension TrainingSessionViewController: ProximityControllerDelegate {
    
    // MARK: - Internal -
    
    internal func objectProximityDetected() {
        self.currentSetCount += 1
        self.updateUI()
    }
    
}
