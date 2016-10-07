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
    func getUpcomingTrainingStage() -> Stage? {
        guard let user = UserController.sharedInstance.currentPushUpUser() else {
            return nil
        }
        
        guard let currentSessionIDs = user.currentSessionIDs else {
            return self.allLevels.first?.stages.first
        }
        
        guard let currentLevelIndex = self.allLevels.index(where: { $0.id == currentSessionIDs.level }) else {
            return nil
        }
        
        let currentLevel = self.allLevels.object(at: currentLevelIndex)
        
        guard let currentStageIndex = currentLevel?.stages.index(where: { $0.id == currentSessionIDs.stage }) else {
            return nil
        }
        
        let nextStageIndex = currentStageIndex + 1
        let nextLevelIndex = currentLevelIndex + 1
        
        guard let nextStage = currentLevel?.stages.object(at: nextStageIndex) else {
            return self.allLevels.object(at: nextLevelIndex)?.stages.first
        }
        
        return nextStage
    }
    
    func getCurrentTrainingStage() -> Stage? {
        guard let user = UserController.sharedInstance.currentPushUpUser() else {
            return nil
        }
        
        guard let currentSessionIDs = user.currentSessionIDs else {
            return self.allLevels.first?.stages.first
        }
        
        let level = self.allLevels.filter({ $0.id == currentSessionIDs.level }).first
        let stage = level?.stages.filter({ $0.id == currentSessionIDs.stage }).first
        
        return stage
    }
    
}
