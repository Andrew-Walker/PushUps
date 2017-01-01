//
//  TitleHeaderFooterView.swift
//  PushUps
//
//  Created by Andrew Walker on 01/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal final class TitleHeaderFooterView: UITableViewHeaderFooterView, SectionHeaderFooterView {
    
    // MARK: - Private Properties
    
    private var titleLabel = UILabel()
    private var text: String?
    
    // MARK: - Internal Properties
    
    internal var height: CGFloat = 30.0
    
    // MARK: - Lifecycle
    
    internal init(text: String) {
        super.init(reuseIdentifier: "tableViewSectionHeaderView")
        
        self.text = text
        
        self.configureUI()
        self.styleUI()
    }
    
    internal required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - UI
    
    private func styleUI() {
        self.backgroundView?.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        self.titleLabel.textColor = UIColor.white
    }
    
    private func configureUI() {
        self.backgroundView = UIView()
        
        self.titleLabel.text = self.text
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.titleLabel)
        
        let edgeInsets = UIEdgeInsets(top: 0.0, left: 18.0, bottom: 0.0, right: 18.0)
        ConstraintHelper.applyMarginConstraints(subview: self.titleLabel, edgeInsets: edgeInsets, superview: self.contentView)
    }
    
}
