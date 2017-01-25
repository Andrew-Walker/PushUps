//
//  Mediator.swift
//  PushUps
//
//  Created by Andrew Walker on 25/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal protocol Mediator: class {
    var leftViewController: UIViewController? { get set }
    var rightViewController: UIViewController? { get set }
    
    func assign(leftViewController: UIViewController?, rightViewController: UIViewController?)
}

internal extension Mediator {
    
    // MARK: - Internal Functions
    
    internal func assign(leftViewController: UIViewController?, rightViewController: UIViewController?) {
        self.leftViewController = leftViewController
        self.rightViewController = rightViewController
    }
    
}
