//
//  TrainingListViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 11/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

internal final class TrainingListViewController: UIViewController, TrainingListViewControllerProxyDelegate {
    
    // MARK: - Properties -
    
    // MARK: Private
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var contentController = TableViewContentController()
    
    // MARK: Internal
    
    internal var proxy: TrainingListViewControllerProxy?
    
    // MARK: - Lifecycle -
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        self.proxy = TrainingListViewControllerProxy(delegate: self)
        
        self.styleUI()
        self.configureUI()
        self.configureContent()
    }
    
    // MARK: - UI -
    
    private func styleUI() {
        self.applyBackground()
        self.tableView.backgroundColor = UIColor.clear
    }
    
    private func configureUI() {
        let rightNavigationItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.dismissViewController))
        self.navigationItem.rightBarButtonItem = rightNavigationItem
    }
    
    private func configureContent() {
        self.contentController.configure(with: self.tableView, estimatedRowHeight: 44.0)
        self.contentController.hidesAdditionalCells = true
        
        let levels = self.proxy?.levels() ?? []
        let sections = TrainingListCellContentFactory.createLevelSections(from: levels)
        self.contentController.add(sections: sections)
        
        self.contentController.reload()
    }
    
    // MARK: - Private -
    
    @objc private func dismissViewController() {
        self.dismiss(animated: true)
    }
    
}
