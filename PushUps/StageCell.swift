//
//  StageCell.swift
//  PushUps
//
//  Created by Andrew Walker on 03/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal final class StageCell: UITableViewCell, Cell {
    
    // MARK: - Properties -
    
    // MARK: Private
    
    @IBOutlet private weak var label: UILabel!
    
    // MARK: Internal
    
    internal var content: CellContent?
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.styleUI()
    }
    
    // MARK: - UI -
    
    private func styleUI() {
        self.backgroundColor = UIColor.clear
        self.label.textColor = UIColor.white
    }
    
    // MARK: - Internal -
    
    internal func configure(with content: CellContent) {
        guard let content = content as? StageCellContent else {
            return
        }
        
        self.label.text = "Stage \(content.number)"
    }
    
}
