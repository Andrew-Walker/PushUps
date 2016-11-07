//
//  HomeViewControllerProxy.swift
//  PushUps
//
//  Created by Andrew Walker on 17/10/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

protocol HomeViewControllerProxyDelegate: class {
    var proxy: HomeViewControllerProxy? { get set }
}

class HomeViewControllerProxy {
    
    // MARK: Properties -
    
    // MARK: Private
    
    private weak var delegate: HomeViewControllerProxyDelegate?
    
    // MARK: Public
        
    // MARK: Lifecycle -
    
    /**
     Designated initializer for HomeViewControllerProxy instance.
     - parameters:
        - delegate: An instance that conforms to HomeViewControllerProxyDelegate protocol.
     */
    init(delegate: HomeViewControllerProxyDelegate) {
        self.delegate = delegate
    }
    
    func titleContent(sessionType: SessionType) -> String {
        guard sessionType == .Session else {
            let levelIndex = SessionController.sharedInstance.getCurrentLevelIndex() 
            let levelIndexLabelText = "Level \(levelIndex)"
            
            return levelIndexLabelText
        }
        
        return "Record goes here"
    }
    
}
