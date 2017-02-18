//
//  TitleSectionHeaderFooterView.swift
//  PushUps
//
//  Created by Andrew Walker on 01/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal final class TitleSectionHeaderFooterView: UITableViewHeaderFooterView, SectionHeaderFooterView {
    
    // MARK: - Private Properties
    
    private var titleLabel = UILabel()
    
    // MARK: - Internal Properties
    
    internal var content: SectionHeaderFooterViewContent?
    
    // MARK: - Lifecycle
    
    internal override func layoutSubviews() {
        super.layoutSubviews()
        
        self.configureUI()
        self.styleUI()
    }
    
    // MARK: - UI
    
    private func styleUI() {
        self.backgroundView?.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        self.titleLabel.textColor = UIColor.white
    }
    
    private func configureUI() {
        self.backgroundView = UIView()
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.titleLabel)
        
        let edgeInsets = UIEdgeInsets(top: 0.0, left: 18.0, bottom: 0.0, right: 18.0)
        ConstraintHelper.applyMarginConstraints(subview: self.titleLabel, edgeInsets: edgeInsets, superview: self)
    }
    
    // MARK: - Internal Functions
    
    internal func configure(with content: SectionHeaderFooterViewContent) {
        self.content = content
        
        self.titleLabel.text = (content as? TitleSectionHeaderFooterViewContent)?.text
    }
    
}
