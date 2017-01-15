//
//  TableViewContentController.swift
//  PushUps
//
//  Created by Andrew Walker on 01/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal final class TableViewContentController: NSObject, ContentController {
    
    // MARK: - Internal Properties
    
    internal var sections = [SectionContent]()
    internal var tableView: UITableView?
    
    internal var hidesAdditionalCells = false {
        didSet {
            let footerView: UIView? = self.hidesAdditionalCells ? UIView() : nil
            self.tableView?.tableFooterView = footerView
        }
    }
    
    // MARK: - Internal Functions
    
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
    
    // MARK: - Internal Functions
    
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
        (cell as? Cell)?.configure(with: content)
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
    
}

extension TableViewContentController: UITableViewDelegate {
    
    // MARK: - Internal Functions
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performAction(for: indexPath)
        self.tableView?.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Private Functions
    
    private func performAction(for indexPath: IndexPath) {
        let content = self.content(for: indexPath)
        switch content {
        case let selectableContent as Selectable:
            self.select(content: selectableContent, at: indexPath)
        default:
            return
        }
    }
    
    private func select(content: Selectable, at indexPath: IndexPath) {
        switch content {
        case let selectableSingleContent as SelectableSingle:
            self.select(content: selectableSingleContent, at: indexPath)
        case let selectableSectionSingleContent as SelectableSectionSingle:
            self.select(content: selectableSectionSingleContent, at: indexPath)
        default:
            return
        }
    }
    
    private func select(content: SelectableSingle, at indexPath: IndexPath) {
        let selectableContent = self.sections.flatMap({ $0.content.flatMap({ $0 as? SelectableSingle }) })
        let contentForDeselection = selectableContent.filter({ $0 !== content })
        let _ = contentForDeselection.map({ $0.isSelected = false })
        content.isSelected = true
        
        let upperRangeBound = self.sections.count
        let range = Range(uncheckedBounds: (0, upperRangeBound))
        let indexSet = IndexSet(integersIn: range)
        
        self.tableView?.reloadSections(indexSet, with: .automatic)
    }
    
    private func select(content: SelectableSectionSingle, at indexPath: IndexPath) {
        let sectionContent = self.sections[indexPath.section].content
        let selectableContent = sectionContent.flatMap({ $0 as? SelectableSectionSingle })
        let contentForDeselection = selectableContent.filter({ $0 !== content })
        let _ = contentForDeselection.map({ $0.isSelected = false })
        content.isSelected = true
        
        let reloadIndex = IndexSet(integer: indexPath.section)
        self.tableView?.reloadSections(reloadIndex, with: .automatic)
    }
    
}
