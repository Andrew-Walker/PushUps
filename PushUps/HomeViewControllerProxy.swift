//
//  HomeViewControllerProxy.swift
//  PushUps
//
//  Created by Andrew Walker on 17/10/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import Foundation

internal protocol HomeViewControllerProxyDelegate: class {
    var proxy: HomeViewControllerProxy? { get set }
}

internal final class HomeViewControllerProxy {
    
    // MARK: - Private Properties
    
    private weak var delegate: HomeViewControllerProxyDelegate?
    
    private let levelText = NSLocalizedString("general.level", comment: "")
    
    // MARK: - Lifecycle
    
    /**
     Designated initializer for HomeViewControllerProxy instance.
     - parameters:
        - delegate: An instance that conforms to HomeViewControllerProxyDelegate protocol.
     */
    internal init(delegate: HomeViewControllerProxyDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Internal Functions
    
    /**
     Gets title content for currently selected SessionType.
     - parameters:
        - sessionType: A case value of SessionType.
     - returns: String value based on passed session type.
    */
    internal func titleContent(sessionType: SessionType) -> String {
        guard sessionType == .Session else {
            let levelIndex = SessionController.sharedInstance.currentLevelIndex()
            let levelIndexLabelText = "\(self.levelText) \(levelIndex)"
            
            return levelIndexLabelText
        }
        
        return "Record goes here"
    }
    
}
