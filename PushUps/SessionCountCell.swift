//
//  SessionCountCell.swift
//  PushUps
//
//  Created by Andrew Walker on 01/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal final class SessionCountCell: UITableViewCell, Cell {
    
    // MARK: - Private Properties
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
    
    // MARK: - Internal Properties
    
    internal var content: CellContent?
    
    // MARK: - Lifecycle
    
    internal override func awakeFromNib() {
        super.awakeFromNib()
        
        self.styleUI()
    }
    
    // MARK: - UI
    
    private func styleUI() {
        self.accessoryType = .disclosureIndicator
        self.backgroundColor = UIColor.clear
        self.label.textColor = UIColor.white
        self.iconImageView.tintColor = UIColor.white
    }
    
    // MARK: - Internal Functions
    
    internal func configure(with content: CellContent) {
        guard let content = content as? SessionCountCellContent else {
            return
        }
        
        let sessionCount = content.count 
        self.label.text = "\(sessionCount) Sessions"
        self.iconImageView.image = content.icon
    }
    
}
