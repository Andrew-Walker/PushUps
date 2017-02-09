//
//  SegmentedControl.swift
//  PushUps
//
//  Created by Andrew Walker on 04/08/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

@IBDesignable internal final class SegmentedControl: UIControl {
    
    // MARK: - Private Properties
    
    private var labels = [UILabel]()
    private var thumbView = UIView()
    
    // MARK: - Internal Properties
    
    internal var items = ["TRAINING", "WORKOUT"] {
        didSet {
            self.setupLabels()
        }
    }
    
    internal var selectedIndex = 0 {
        didSet {
            self.updateSelectedIndex()
        }
    }
    
    @IBInspectable internal var selectedLabelColor = UIColor.white {
        didSet {
            self.setSelectedColors(toDefault: false)
        }
    }
    
    @IBInspectable internal var unselectedLabelColor = UIColor.black {
        didSet {
            self.setSelectedColors(toDefault: true)
        }
    }
    
    @IBInspectable internal var thumbColor = UIColor.black {
        didSet {
            self.setSelectedColors(toDefault: true)
        }
    }
    
    @IBInspectable internal var borderColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable internal var font = UIFont.systemFont(ofSize: 10) {
        didSet {
            self.setFont()
        }
    }
    
    // MARK: - Lifecycle
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configureUI()
    }
    
    internal required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.configureUI()
    }
    
    internal override func layoutSubviews() {
        super.layoutSubviews()
        
        self.styleUI()
        self.layoutThumbView()
        self.updateSelectedIndex()
    }
    
    // MARK: - UI
    
    private func styleUI() {
        self.backgroundColor = UIColor.darkBackground
        self.applyRoundCorners()
    }
    
    private func configureUI() {
        self.insertSubview(self.thumbView, at: 0)
        self.setupLabels()
    }
    
    private func setupLabels() {
        for label in self.labels {
            label.removeFromSuperview()
        }
        
        self.labels.removeAll(keepingCapacity: true)
        
        for index in 0...self.items.count - 1 {
            let defaultWidth = 70.0, defaultHeight = 40.0
            
            let label = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: defaultWidth, height: defaultHeight))
            label.textAlignment = .center
            label.textColor = index == 0 ? self.selectedLabelColor : self.unselectedLabelColor
            label.text = self.items[index]
            label.font = self.font
            label.translatesAutoresizingMaskIntoConstraints = false
            
            self.addSubview(label)
            self.labels.append(label)
        }
        
        self.addConstraints(forItems: self.labels)
    }
    
    private func setSelectedColors(toDefault: Bool) {
        for item in self.labels {
            item.textColor = self.unselectedLabelColor
        }
        
        let index = toDefault ? 0 : self.selectedIndex
        self.labels[index].textColor = self.selectedLabelColor
        self.thumbView.backgroundColor = self.thumbColor
    }
    
    private func setFont() {
        for item in self.labels {
            item.font = self.font
        }
    }
    
    // MARK: - Layout
    
    private func addConstraints(forItems items: [UIView]) {
        for (index, button) in items.enumerated() {
            let topConstraint = NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0)
            let bottomConstraint = NSLayoutConstraint(item: button, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
            
            var rightConstraint: NSLayoutConstraint!
            if index == items.count - 1 {
                rightConstraint = NSLayoutConstraint(item: button, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0)
            } else {
                let nextButton = items[index + 1]
                rightConstraint = NSLayoutConstraint(item: button, attribute: .right, relatedBy: .equal, toItem: nextButton, attribute: .left, multiplier: 1.0, constant: 0.0)
            }
            
            var leftConstraint: NSLayoutConstraint!
            if index == 0 {
                leftConstraint = NSLayoutConstraint(item: button, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0)
            } else {
                let prevButton = items[index - 1]
                leftConstraint = NSLayoutConstraint(item: button, attribute: .left, relatedBy: .equal, toItem: prevButton, attribute: .right, multiplier: 1.0, constant: 0.0)
                
                let firstItem = items[0]
                let widthConstraint = NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: firstItem, attribute: .width, multiplier: 1.0  , constant: 0.0)
                
                self.addConstraint(widthConstraint)
            }
            
            self.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint])
        }
    }
    
    private func layoutThumbView() {
        var thumbFrame = self.bounds
        let width = thumbFrame.width / CGFloat(self.items.count)
        thumbFrame.size.width = width
        self.thumbView.frame = thumbFrame
        self.thumbView.backgroundColor = self.thumbColor
        self.thumbView.applyRoundCorners()
    }
    
    // MARK: - Touch Events
    
    private func updateSelectedIndex() {
        self.setSelectedColors(toDefault: false)
        
        let selectedLabelFrame = self.labels[self.selectedIndex].frame
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.init(rawValue: 0), animations: {
            self.thumbView.frame = selectedLabelFrame
        }, completion: nil)
    }
    
    internal override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.beginTracking(touch, with: event)
        
        guard let index = self.calculateCurrentIndex(atTouch: touch) else {
            return false
        }
        
        self.selectedIndex = index
        self.sendActions(for: .valueChanged)
        
        return false
    }
    
    private func calculateCurrentIndex(atTouch touch: UITouch) -> Int? {
        let location = touch.location(in: self)
        
        for (index, item) in self.labels.enumerated() {
            if item.frame.contains(location) {
                return index
            }
        }
        
        return nil
    }
    
}
