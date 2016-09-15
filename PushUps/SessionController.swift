//
//  SessionController.swift
//  PushUps
//
//  Created by Andrew Walker on 06/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import Foundation

class SessionController {
    
    // MARK: Properties -
    
    // MARK: Public
    
    static let sharedInstance = SessionController()
    
    var currentSessionType: SessionType?
    
    // MARK: Private
    
    private(set) var allLevels: [Level] = []
    
    private var currentSession: Session?
    
    // MARK: Lifecycle -
    
    /**
     Restricts ability to create instance. Intended as singleton.
     */
    private init() {}
    
    /**
     
     */
    func loadAllLevels() {
        self.allLevels = SessionFactory.loadAllLevels()
    }
    
    /**
     
     */
    func startNewSession() {
        self.currentSession = SessionFactory.createSession()
        self.currentSession?.startSession()
    }
    
    /**
     
     */
    func endCurrentSession(withCount count: Int) {
        guard var currentSession = self.currentSession else {
            return
        }
        
        currentSession.endSession(withCount: count)
        
        self.currentSession = nil
    }
    
    /**
     
     */
    private func getNextTrainingSession() {
        
    }
    
}
