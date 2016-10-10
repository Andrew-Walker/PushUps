//
//  HomeTrainingViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 12/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

class HomeTrainingViewController: UIViewController, HomeTrainingViewControllerProxyDelegate {
    
    // MARK: Properties -
    
    // MARK: Private
    
    @IBOutlet private weak var stageIndexLabel: UILabel!
    @IBOutlet private weak var stageCountLabel: UILabel!
    
    // MARK: Public
    
    var proxy: HomeTrainingViewControllerProxy?
    
    // MARK: Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.proxy = HomeTrainingViewControllerProxy(delegate: self)
        
        self.styleUI()
        self.configureUI()
    }
    
    // MARK: UI -
    
    private func styleUI() {
        self.view.backgroundColor = UIColor.clear
    }
    
    private func configureUI() {
//        self.currentStageLabel.text = self.proxy?.currentStage()?.id
        
        let stageCount = self.proxy?.currentStageCount() ?? 0
        let stageCountLabelText = "of \(stageCount)"
        self.stageCountLabel.text = stageCountLabelText
        
        let stageIndex = self.proxy?.currentStageIndex() ?? 0
        let stageIndexLabelText = String(describing: stageIndex)
        self.stageIndexLabel.text = stageIndexLabelText
    }
    
}
