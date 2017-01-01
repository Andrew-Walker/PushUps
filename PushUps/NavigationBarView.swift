//
//  NavigationBarView.swift
//  PushUps
//
//  Created by Andrew Walker on 06/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

/// View used within navigation bar in most views. Contains title and subtitle labels.
internal final class NavigationBarView: UIView {
    
    // MARK: - Properties -
    
    // MARK: Private
    
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var subtitleLabel: UILabel?
    
    // MARK: Internal
    
    // MARK: - Lifecycle -
    
    internal override func awakeFromNib() {
        super.awakeFromNib()
                
        self.backgroundColor = UIColor.clear
        self.titleLabel?.textColor = UIColor.white
        self.subtitleLabel?.textColor = UIColor.white.withAlphaComponent(0.5)
    }
    
    // MARK: - Internal -
    
    internal class func instanceFromNib() -> NavigationBarView? {
        return Bundle.main.loadNibNamed("NavigationBarView", owner: nil, options: nil)?.first as? NavigationBarView
    }
    
    /**
     Sets navigation bar title text.
     - parameters:
        withText: Text for title label content.
     */
    internal func setTitleContent(with text: String?) {
        self.titleLabel?.text = text
    }
    
    /**
     Sets navigation bar subtitle text.
     - parameters:
        withText: Text for subtitle label content.
     */
    internal func setSubtitleContent(with text: String?) {
        self.subtitleLabel?.text = text
    }
    
}
