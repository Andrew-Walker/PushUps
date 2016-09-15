//
//  Stage.swift
//  PushUps
//
//  Created by Andrew Walker on 15/09/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

protocol Stage {
    var id: String { get }
    var sets: [Set] { get }
}

struct TrainingStage: Stage {
    var id: String
    var sets: [Set]
}