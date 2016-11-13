//
//  CountdownViewControllerProxy.swift
//  PushUps
//
//  Created by Andrew Walker on 30/10/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

protocol CountdownViewControllerProxyDelegate: class {
    var proxy: CountdownViewControllerProxy? { get set }
}

class CountdownViewControllerProxy {
    
    // MARK: - Properties -
    
    // MARK: Private
    
    private weak var delegate: CountdownViewControllerProxyDelegate?
    
    // MARK: Internal
    
    // MARK: - Lifecycle -
    
    /**
     Designated initializer for CountdownViewControllerProxy instance.
     - parameters:
        - delegate: An instance that conforms to HomeViewControllerProxyDelegate protocol.
     */
    internal init(delegate: CountdownViewControllerProxyDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Internal -
    
    /**
     Gets type of session to start at end of countdown.
     - returns: SessionType case of upcoming session.
    */
    internal func sessionType() -> SessionType? {
        return SessionController.sharedInstance.currentSessionType()
    }
    
}
