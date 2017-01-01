//
//  SessionController.swift
//  PushUps
//
//  Created by Andrew Walker on 06/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import Foundation

internal final class SessionController {
    
    // MARK: - Properties -
    
    // MARK: Private
    
    private var allLevels: [Level] = []
    private var session: Session?
    private var sessionType: SessionType?
    
    // MARK: Internal
    
    internal static let sharedInstance = SessionController()
    
    // MARK: - Lifecycle -
    
    /**
     Restricts ability to create instance. Intended as singleton.
     */
    private init() {}
    
    // MARK: - Private -
    
    /**
     Gets current training level by filtering full list based on level ID.
     - returns: Instance conforming to Level protocol.
     */
    private func currentTrainingLevel() -> Level? {
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
    private func currentTrainingStage() -> Stage? {
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
    
    // MARK: - Internal -
    
    /**
     Populates levels array by calling SessionFactory to load list of levels from local plist file.
     */
    internal func loadAllLevels() {
        self.allLevels = SessionFactory.loadAllLevels()
    }
    
    /**
     Gets session currently in progress.
     - returns: Instance conforming to Session.
     */
    internal func activeSession() -> Session? {
        return self.session
    }
    
    /**
     Gets type of active session.
     - returns: SessionType case representing active session type.
     */
    internal func activeSessionType() -> SessionType? {
        return self.sessionType
    }
    
    /**
     Sets type of active session.
    */
    internal func setActive(sessionType: SessionType) {
        self.sessionType = sessionType
    }
    
    /**
     Activates new workout session.
     */
    internal func activateWorkoutSession() {
        self.session = WorkoutSession()
        self.session?.start()
    }
    
    /**
     Activates new training session.
     */
    internal func activateTrainingSession() {
        guard let stage = self.currentTrainingStage() else {
            return
        }
        
        self.session = TrainingSession(stage: stage)
        self.session?.start()
    }
    
    /**
     Ends currently active workout session.
     - parameters:
        - count: Int value representing total push up count on session completion.
     */
    internal func endActiveWorkoutSession(with count: Int) {
        (self.session as? WorkoutSession)?.end(with: count)
    }
    
    /**
     Ends currently active training session.
     */
    internal func endActiveTrainingSession() {
        (self.session as? TrainingSession)?.end()
    }
    
    /**
     Sets currently active stored session to nil.
     */
    internal func clearActiveSession() {
        self.session = nil
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
    
    /**
     Gets sets in currently active stage.
     - returns: Array of instances conforming to Set.
     */
    internal func activeStageSets() -> [Set] {
        let stage = (self.session as? TrainingSession)?.stage
        let sets = stage?.sets ?? []
        
        return sets
    }
    
    /**
     Gets currently active set in active stage.
     - returns: Instance conforming to Set.
    */
    internal func activeStageActiveSet() -> Set? {
        let stage = (self.session as? TrainingSession)?.stage
        let set = stage?.sets.filter({ $0.isCurrent }).first
        
        return set
    }
    
    /**
     Gets next training stage IDs using successor index to current stage. Failing this,
     the next level (if available), is searched.
     - returns: Tuple containing level and stage ID.
     */
    internal func nextTrainingStageIDs(for user: User) -> (levelID: String?, stageID: String?)? {
        guard let currentSessionIDs = user.currentSessionIDs else {
            let level = self.allLevels.first
            let stage = level?.stages.first
            
            return (level?.id, stage?.id)
        }
        
        guard let currentLevelIndex = self.allLevels.index(where: { $0.id == currentSessionIDs.level }) else {
            return nil
        }
        
        guard let currentLevel = self.allLevels.object(at: currentLevelIndex) else {
            return nil
        }
        
        guard let currentStageIndex = currentLevel.stages.index(where: { $0.id == currentSessionIDs.stage }) else {
            return nil
        }
        
        let nextStageIndex = currentStageIndex + 1
        let nextLevelIndex = currentLevelIndex + 1
        
        guard let nextStage = currentLevel.stages.object(at: nextStageIndex) else {
            let level = self.allLevels.object(at: nextLevelIndex)
            let stage = level?.stages.first
            
            return (level?.id, stage?.id)
        }
        
        return (currentLevel.id, nextStage.id)
    }
    
}
