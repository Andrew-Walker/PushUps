//
//  Button.swift
//  PushUps
//
//  Created by Andrew Walker on 10/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

/// General button style with highlighting customisation.
class Button: UIButton {
    // MARK:
    // MARK: Properties -
    
    // MARK: Private
    
    private var highlightedBackgroundColor: UIColor?
    private var normalBackgroundColor: UIColor? {
        didSet {
            self.highlightedBackgroundColor = self.normalBackgroundColor?.adjust(red: -0.1, green: -0.1, blue: -0.1, alpha: 0.0)
        }
    }
    
    // MARK: Public
    
    /// Color of background.
    @IBInspectable override var backgroundColor: UIColor? {
        didSet {
            self.normalBackgroundColor = self.backgroundColor
        }
    }
    
    /// Indicates current highlight state of button. Defaults to false.
    @IBInspectable override var isHighlighted: Bool {
        didSet {
            super.backgroundColor = self.isHighlighted ? self.highlightedBackgroundColor : self.normalBackgroundColor
            self.titleLabel?.layer.opacity = self.isHighlighted ? 0.5 : 1.0
            self.imageView?.layer.opacity = self.isHighlighted ? 0.5 : 1.0
        }
    }
    
    /// Indicates whether button is enabled. Defaults to true.
    @IBInspectable override var isEnabled: Bool {
        didSet {
            self.backgroundColor = self.normalBackgroundColor
            self.layer.opacity = self.isEnabled ? 1.0 : 0.7
        }
    }
}

/// Main button used in HomeViewController for starting new sessions.
class SessionButton: Button {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.applyRoundCorners()
    }
    
    override func setTitle(_ title: String?, for state: UIControlState) {
        guard let title = title else {
            return
        }
        
        super.setTitle("START \(title)", for: state)
        
        self.setTitleColor(UIColor.white(), for: [])
        self.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
        self.titleLabel?.text = self.titleLabel?.text?.uppercased()
    }
}
