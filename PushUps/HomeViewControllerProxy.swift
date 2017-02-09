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
    
}
