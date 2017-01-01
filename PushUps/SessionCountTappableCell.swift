//
//  SessionCountTappableCell.swift
//  PushUps
//
//  Created by Andrew Walker on 01/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal final class SessionCountTappableCell: UITableViewCell, Cell {
    
    // MARK: - Properties -
    
    // MARK: Private
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
    
    // MARK: Internal
    
    internal var content: CellContent?
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.styleUI()
    }
    
    // MARK: - Private -
    
    private func styleUI() {
        self.accessoryType = .disclosureIndicator
        self.backgroundColor = UIColor.clear
        self.label.textColor = UIColor.white
        self.iconImageView.tintColor = UIColor.white
    }
    
    internal func configure(with content: CellContent) {
        guard let content = content as? SessionCountTappableCellContent else {
            return
        }
        
        let sessionCount = content.count 
        self.label.text = "\(sessionCount) Sessions"
        self.iconImageView.image = content.icon
    }
    
}
