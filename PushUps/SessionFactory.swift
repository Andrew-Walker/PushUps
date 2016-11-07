//
//  SessionFactory.swift
//  PushUps
//
//  Created by Andrew Walker on 12/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

class SessionFactory {
    
    // MARK: - Lifecycle -
    
    /**
     Restricts ability to create instance. Intended as singleton.
     */
    private init() {}
    
    // MARK: - SessionFactory
    
    /**
     Retrieves data from TrainingSessions plist file and passes this array to factory function to create training levels.
     - returns: Array of instances conforming to Level protocol.
     */
    internal static func loadAllLevels() -> [Level] {
        var levels = [Level]()
        
        if let path = Bundle.main.path(forResource: "TrainingSessions", ofType: "plist"), let array = NSArray(contentsOfFile: path) {
            levels = SessionFactory.createLevels(fromArray: array)
        }
        
        return levels
    }
    
    /**
     Creates array of instances conforming to Level protocol from data passed in array.
     - parameters:
        - array: NSArray containing data required to build instances conformining to Level.
     - returns: Array of instances conforming to Level protocol.
     */
    private static func createLevels(fromArray array: NSArray) -> [Level] {
        let levelDictionaries = array as! [[String: AnyObject]]
        var levels = [Level]()
        
        for levelDictionary in levelDictionaries {
            let levelID = levelDictionary["id"] as? String
            let stageDictionaries = levelDictionary["stages"] as! [[String: AnyObject]]
            
            guard let id = levelID else {
                continue
            }
            
            let stages = SessionFactory.createStages(fromArray: stageDictionaries)
            let level = TrainingLevel(id: id, stages: stages)
            levels.append(level)
        }
        
        return levels
    }
    
    /**
     Creates array of instances conforming to Stage protocol from data passed in array of dictionaries.
     - parameters:
        - array: Array of dictionaries containing data required to build instances conformining to Stage.
     - returns: Array of instances conforming to Stage protocol.
     */
    private static func createStages(fromArray array: [[String: AnyObject]]) -> [Stage] {
        var stages = [Stage]()
        
        for stageDictionary in array {
            let stageID = stageDictionary["id"] as? String
            let stageSetDictionaries = stageDictionary["sets"] as! [[String: AnyObject]]
            
            guard let id = stageID else {
                continue
            }
            
            let sets = SessionFactory.createSets(fromArray: stageSetDictionaries)
            let stage = TrainingStage(id: id, sets: sets)
            stages.append(stage)
        }
        
        return stages
    }
    
    /**
     Creates array of instances conforming to Set protocol from data passed in array of dictionaries.
     - parameters:
        - array: Array of dictionaries containing data required to build instances conformining to Set.
     - returns: Array of instances conforming to Set protocol.
     */
    private static func createSets(fromArray array: [[String: AnyObject]]) -> [Set] {
        var sets = [Set]()
        
        for setDictionary in array {
            let pushups = setDictionary["pushups"] as? Int ?? 0
            let interval = setDictionary["interval"] as? Int ?? 0
            
            let set = TrainingSet(pushups: pushups, interval: interval)
            sets.append(set)
        }
        
        return sets
    }
    
}
