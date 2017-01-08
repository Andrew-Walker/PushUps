//
//  StageCell.swift
//  PushUps
//
//  Created by Andrew Walker on 03/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal final class StageCell: UITableViewCell, Cell {
    
    // MARK: - Private Properties
    
    @IBOutlet private weak var label: UILabel!
    
    // MARK: - Internal Properties
    
    internal var content: CellContent?
    
    // MARK: - Lifecycle
    
    internal override func awakeFromNib() {
        super.awakeFromNib()
        
        self.styleUI()
    }
    
    // MARK: - UI
    
    private func styleUI() {
        self.backgroundColor = UIColor.clear
        self.label.textColor = UIColor.white
        self.tintColor = UIColor.white
    }
    
    // MARK: - Internal Functions
    
    internal func configure(with content: CellContent) {
        guard let content = content as? StageCellContent else {
            return
        }
        
        self.label.text = "Stage \(content.number)"
        self.accessoryType = content.isSelected ? .checkmark : .none
    }
    
}
