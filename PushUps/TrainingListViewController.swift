//
//  TrainingListViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 11/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

internal final class TrainingListViewController: UIViewController, TrainingListViewControllerProxyDelegate {
    
    // MARK: - Private Properties
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let trainingLevelsText = NSLocalizedString("trainingListViewController.trainingLevels", comment: "")
    
    private var contentController = TableViewContentController()
    
    // MARK: - Internal Properties
    
    internal var proxy: TrainingListViewControllerProxy?
    internal var selectedSessionType: SessionType?
    
    // MARK: - Lifecycle
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        self.proxy = TrainingListViewControllerProxy(delegate: self)
        self.selectedSessionType = self.proxy?.selectedSessionType()
        
        self.styleUI()
        self.configureUI()
        self.configureContent()
    }
    
    // MARK: - UI
    
    private func styleUI() {
        self.applyBackgroundGradient()
        self.tableView.backgroundColor = UIColor.clear
        
        let themeColor = self.selectedSessionType?.themeColor
        self.view.backgroundColor = themeColor
    }
    
    private func configureUI() {
        let rightNavigationItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.dismissViewController))
        self.navigationItem.rightBarButtonItem = rightNavigationItem
        
        self.navigationItem.title = self.trainingLevelsText
    }
    
    private func configureContent() {
        self.contentController.configure(with: self.tableView, estimatedRowHeight: 44.0)
        self.contentController.register(headerFooterViewClass: TitleSectionHeaderFooterView.self, reuseIdentifier: "TitleSectionHeaderFooterView")
        self.contentController.hidesAdditionalCells = true
        
        let levels = self.proxy?.levels() ?? []
        let currentStage = self.proxy?.currentStage()
        let sections = TrainingListCellContentFactory.createLevelSections(from: levels, selectedStage: currentStage)
        self.contentController.add(sections: sections)
        
        self.contentController.reload()
    }
    
    // MARK: - Private Functions
    
    @objc private func dismissViewController() {
        let selectedContentSections = self.contentController.selectedContentSections()
        let selectedLevel = (selectedContentSections.first as? LevelSectionContent)?.level
        
        let selectedContent = self.contentController.selectedContent()
        let selectedStage = (selectedContent.first as? StageCellContent)?.stage
        
        self.proxy?.set(currentLevel: selectedLevel, currentStage: selectedStage)
        self.dismiss(animated: true)
    }
    
}
