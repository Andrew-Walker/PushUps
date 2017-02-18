//
//  WorkoutChartChartDataSetFactory.swift
//  PushUps
//
//  Created by Andrew Walker on 18/02/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import Charts

internal final class WorkoutChartChartDataSetFactory {
    
    // MARK: - Lifecycle
    
    /**
     Restricts ability to create instance. Intended as singleton.
     */
    private init() {}

    // MARK: - Internal Functions
    
    internal static func createWorkoutChartData(from workoutSessions: [WorkoutSession]) -> LineChartData? {
        guard !workoutSessions.isEmpty else {
            return nil
        }
        
        var dataEntries = [ChartDataEntry]()
        for (index, workoutSession) in workoutSessions.enumerated() {
            let x = Double(index)
            let y = Double(workoutSession.pushups)
            let workoutSessionDataEntry = ChartDataEntry(x: x, y: y)
            dataEntries.append(workoutSessionDataEntry)
        }
        
        let workoutSessionDataSet = LineChartDataSet(values: dataEntries, label: nil)
        workoutSessionDataSet.lineWidth = 3.0
        workoutSessionDataSet.drawCirclesEnabled = false
        workoutSessionDataSet.setColor(UIColor.white)
        workoutSessionDataSet.drawValuesEnabled = false
        
        let workoutSessionData = LineChartData(dataSets: [workoutSessionDataSet])
        return workoutSessionData
    }
}
