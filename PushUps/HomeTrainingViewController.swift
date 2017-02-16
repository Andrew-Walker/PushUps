//
//  HomeTrainingViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 12/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

internal final class HomeTrainingViewController: UIViewController, TransitionalViewController,  HomeTrainingViewControllerProxyDelegate {
    
    // MARK: - Properties Properties
    
    @IBOutlet private weak var stageIndexLabel: UILabel!
    @IBOutlet private weak var stageCountLabel: UILabel!
    @IBOutlet private weak var setsStackView: UIStackView!
    
    private let ofText = NSLocalizedString("general.of", comment: "")
    
    // MARK: - Internal Properties
    
    internal let subtitleText = NSLocalizedString("trainingSessionType.trainingLevel", comment: "")
    internal let startButtonText = NSLocalizedString("trainingSessionType.startTraining", comment: "").uppercased()
    
    internal var proxy: HomeTrainingViewControllerProxy?
    internal var contentOffsetRange: Range<CGFloat> = 0.0..<0.0
    internal let sessionType: SessionType = TrainingSessionType()
    internal var titleText: String?
    internal var rightNavigationBarItem: UIBarButtonItem?
    
    // MARK: - Lifecycle
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        self.proxy = HomeTrainingViewControllerProxy(delegate: self)
        
        self.styleUI()
    }
    
    internal override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.configureUI()
        self.configureContent()
    }
    
    // MARK: - UI
    
    private func styleUI() {
        self.view.backgroundColor = UIColor.clear
    }
    
    private func configureUI() {
        let stageCount = self.proxy?.currentStageCount() ?? 0
        let stageCountLabelText =  "\(self.ofText) \(stageCount)"
        self.stageCountLabel.text = stageCountLabelText
        
        let stageIndex = self.proxy?.currentStageIndex() ?? 0
        let stageIndexLabelText = String(describing: stageIndex)
        self.stageIndexLabel.text = stageIndexLabelText
        
        self.configureSetsStackView()
    }
    
    private func configureContent() {
        self.titleText = self.proxy?.titleString()
        self.rightNavigationBarItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
    }
    
    private func configureSetsStackView() {
        let sets = self.proxy?.currentStageSets() ?? []
        
        for subview in self.setsStackView.arrangedSubviews {
            subview.removeFromSuperview()
        }
        
        for (index, set) in sets.enumerated() {
            let setLabel = UILabel()
            let setPushups = set.pushups 
            let setLabelText = String(describing: setPushups)
            setLabel.text = setLabelText
            setLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 35.0).isActive = true
            setLabel.applySetsStackViewStandardStyle()
            
            self.setsStackView.addArrangedSubview(setLabel)
            
            if index != (sets.count - 1) {
                let dividerLabel = UILabel()
                dividerLabel.text = "-"
                dividerLabel.widthAnchor.constraint(equalToConstant: 10.0).isActive = true
                dividerLabel.applySetsStackViewStandardStyle()
                
                self.setsStackView.addArrangedSubview(dividerLabel)
            }
        }
    }
    
}
