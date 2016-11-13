//
//  SessionController.swift
//  PushUps
//
//  Created by Andrew Walker on 06/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import Foundation

class SessionController {
    
    // MARK: - Properties -
    
    // MARK: Private
    
    private(set) var allLevels: [Level] = []
    
    private var session: Session?
    private var sessionType: SessionType?
    
    // MARK: Internal
    
    internal static let sharedInstance = SessionController()
    
    // MARK: - Lifecycle -
    
    /**
     Restricts ability to create instance. Intended as singleton.
     */
    private init() {}
    
    // MARK: - Internal -
    
    /**
     Sets type of current session.
     */
    internal func set(sessionType: SessionType) {
        self.sessionType = sessionType
    }
    
    /**
     Gets type of current session.
     */
    internal func currentSessionType() -> SessionType? {
        return self.sessionType
    }
    
    /**
     Gets session currently in progress.
     - returns: Instance conforming to Session.
     */
    internal func currentSession() -> Session? {
        return self.session
    }
    
    /**
     Populates levels array by calling SessionFactory to load list of levels from local plist file.
     */
    internal func loadAllLevels() {
        self.allLevels = SessionFactory.loadAllLevels()
    }
    
    /**
     Starts new workout session.
     */
    internal func startNewWorkoutSession() {
        self.session = WorkoutSession()
        self.session?.startSession()
    }
    
    /**
     Ends currently running session and sets to nil.
     - parameters:
        - count: Int value representing total push up count on session completion.
     */
    internal func endCurrentWorkoutSession(with count: Int) {
        (self.session as? WorkoutSession)?.endSession(with: count)
    }
    
    /**
     Sets current in-progress stored session to nil.
     */
    internal func clearCurrentSession() {
        self.session = nil
    }
    
    /**
     Gets next training stage using successor index to current stage. Failing this,
     the next level (if available), is searched.
     - returns: Instance conforming to Stage protocol.
     */
    internal func nextTrainingStage() -> Stage? {
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
    
    /**
     Gets current training level by filtering full list based on level ID.
     - returns: Instance conforming to Level protocol.
     */
    internal func currentTrainingLevel() -> Level? {
        guard let user = UserController.sharedInstance.currentPushUpUser() else {
            return nil
        }
        
        guard let currentSessionIDs = user.currentSessionIDs else {
            return self.allLevels.first
        }
        
        return self.allLevels.filter({ $0.id == currentSessionIDs.level }).first
    }
    
    /**
     Gets current training stage by filtering stages based on stage ID.
     - returns: Instance conforming to Stage protocol.
     */
    internal func currentTrainingStage() -> Stage? {
        let level = self.currentTrainingLevel()
        
        guard let user = UserController.sharedInstance.currentPushUpUser() else {
            return nil
        }
        
        guard let currentSessionIDs = user.currentSessionIDs else {
            return level?.stages.first
        }
        
        let stage = level?.stages.filter({ $0.id == currentSessionIDs.stage }).first
        return stage
    }
    
    /**
     Gets number of stages in current training level.
     - returns: Int value representing number of stages in current training level.
     */
    internal func currentStageCount() -> Int {
        let level = self.currentTrainingLevel()
        let stageCount = level?.stages.count ?? 0
        
        return stageCount
    }
    
    /**
     Gets index of current stage in training level.
     - returns: Int value representing index of current stage in training level.
     */
    internal func currentStageIndex() -> Int {
        let level = self.currentTrainingLevel()
        let stage = self.currentTrainingStage()
        let index = level?.stages.index(where: { $0.id == stage?.id }) ?? 0
        
        return index + 1
    }
    
    /**
     Gets index of current training level.
     - returns: Int value representing index of current training level.
    */
    internal func currentLevelIndex() -> Int {
        let level = self.currentTrainingLevel()
        let index = self.allLevels.index(where: { $0.id == level?.id }) ?? 0
        
        return index + 1
    }
    
    /**
     Gets sets in current stage.
     - returns: Array of instances conforming to Set.
     */
    internal func currentStageSets() -> [Set] {
        let stage = self.currentTrainingStage()
        let sets = stage?.sets ?? []
        
        return sets
    }
    
}
