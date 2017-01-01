//
//  Array+PushUps.swift
//  PushUps
//
//  Created by Andrew Walker on 07/10/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

internal extension Array {
    
    /**
     Gets object at specified index.
     - parameters:
        - index: Index used to subscript array.
     - returns: Element at index passed.
     */
    internal func object(at index: Int) -> Element? {
        let indexExists = self.indices.contains(index)
        return indexExists ? self[index] : nil
    }
    
    /**
     Gets last index.
     - returns: Int value representing last index.
    */
    internal func lastIndex() -> Int? {
        return self.indices.last
    }
    
    /**
     Gets second to last index if valid.
     - returns: Int value representing second to last, or last index.
    */
    internal func lastValidIndexPredecessor() -> Int? {
        guard let lastIndex = self.lastIndex() else {
            return nil
        }
        
        let previousIndex = lastIndex - 1
        return self.indices.contains(previousIndex) ? previousIndex : 0
    }
    
}
