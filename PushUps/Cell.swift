//
//  Cell.swift
//  PushUps
//
//  Created by Andrew Walker on 01/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

internal protocol Cell: class {
    var content: CellContent? { get set }
    
    func configure(with content: CellContent)
}
