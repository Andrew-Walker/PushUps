//
//  CountdownViewControllerProxy.swift
//  PushUps
//
//  Created by Andrew Walker on 30/10/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

internal protocol CountdownViewControllerProxyDelegate: class {
    var proxy: CountdownViewControllerProxy? { get set }
}

internal final class CountdownViewControllerProxy {
    
    // MARK: - Private Properties
    
    private weak var delegate: CountdownViewControllerProxyDelegate?
    
    // MARK: - Internal Properties
    
    /**
     Designated initializer for CountdownViewControllerProxy instance.
     - parameters:
        - delegate: An instance that conforms to HomeViewControllerProxyDelegate protocol.
     */
    internal init(delegate: CountdownViewControllerProxyDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Internal Functions
    
    /**
     Gets type of selected session to start at end of countdown.
     - returns: Struct conforming to SessionType representing selected session.
     */
    internal func selectedSessionType() -> SessionType? {
        return SessionController.sharedInstance.selectedSessionType
    }
    
}
