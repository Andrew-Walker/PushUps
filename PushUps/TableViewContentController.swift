//
//  TableViewContentController.swift
//  PushUps
//
//  Created by Andrew Walker on 01/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal final class TableViewContentController: NSObject, ContentController {
    
    // MARK: - Properties -
    
    // MARK: Internal
    
    internal var sections = [Section]()
    internal var tableView: UITableView?
    
    internal var hidesAdditionalCells = false {
        didSet {
            let footerView: UIView? = self.hidesAdditionalCells ? UIView() : nil
            self.tableView?.tableFooterView = footerView
        }
    }
    
    // MARK: - Internal -
    
    internal func configure(with tableView: UITableView?, estimatedRowHeight: CGFloat? = nil) {
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.separatorColor = UIColor.white.withAlphaComponent(0.5)
        
        if let rowHeight = estimatedRowHeight {
            tableView?.estimatedRowHeight = rowHeight
            tableView?.rowHeight = UITableViewAutomaticDimension
        }
        
        self.tableView = tableView
    }
    
    internal func reload() {
        self.tableView?.reloadData()
    }
    
}

extension TableViewContentController: UITableViewDataSource {
    
    // MARK: - Internal -
    
    internal func numberOfSections(in tableView: UITableView) -> Int {
        return self.numberOfSections()
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.numberOfItems(in: section)
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = self.cellIdentifier(for: indexPath)
        let cell = self.tableView?.dequeueReusableCell(withIdentifier: cellIdentifier) ?? UITableViewCell()
        let content = self.sections[indexPath.section].content[indexPath.row]
        self.configure(cell: cell, with: content)
        return cell
    }
    
    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.sections[section].headerView as? UIView
    }
    
    internal func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return self.sections[section].footerView as? UIView
    }
    
    internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.sections[section].headerView?.height ?? 0.0
    }
    
    internal func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return self.sections[section].footerView?.height ?? 0.0
    }
    
    // MARK: - Private -
    
    private func configure(cell: UITableViewCell, with content: CellContent) {
        guard let cell = cell as? Cell else {
            return
        }
        
        cell.configure(with: content)
    }
    
}

extension TableViewContentController: UITableViewDelegate {
    
}
