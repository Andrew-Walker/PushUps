//
//  String+PushUps.swift
//  PushUps
//
//  Created by Andrew Walker on 12/11/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

internal extension String {
    
    // MARK: - Internal Functions
    
    /**
     Creates string representing positive or negative difference in pushup sessions.
     - parameters:
        - previousSession: Instance conforming to Session of last completed session
        - priorSession: Instance conforming to Session of second last completed session.
     - returns: String representing difference in pushup session results.
    */
    internal static func differenceBetween(previousSession: Session?, priorSession: Session?) -> String {
        guard let previousSession = previousSession else {
            return "+0"
        }
        
        guard let priorSession = priorSession else {
            return "+\(previousSession.pushups)"
        }
        
        let difference = previousSession.pushups - priorSession.pushups
        let differenceString = difference >= 0 ? "+\(difference)" : "\(difference)"
        return differenceString
    }
    
}
