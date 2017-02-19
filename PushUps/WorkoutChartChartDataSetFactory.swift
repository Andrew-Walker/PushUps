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
    
    internal static func createLineChartData(from workoutSessions: [WorkoutSession]) -> LineChartData? {
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
        
        let lineChartDataSet = WorkoutChartChartDataSetFactory.createLineChartDataSet(from: dataEntries)
        let workoutSessionData = LineChartData(dataSets: [lineChartDataSet])
        return workoutSessionData
    }
    
    // MARK: - Private Functions
    
    private static func createLineChartDataSet(from dataEntries: [ChartDataEntry]) -> LineChartDataSet {
        let lineChartDataSet = LineChartDataSet(values: dataEntries, label: nil)
        lineChartDataSet.lineWidth = 3.0
        lineChartDataSet.drawCirclesEnabled = false
        lineChartDataSet.setColor(UIColor.white)
        lineChartDataSet.drawValuesEnabled = true
        lineChartDataSet.valueTextColor = UIColor.white.withAlphaComponent(0.75)
        lineChartDataSet.valueFont = UIFont.boldFont(ofSize: 12.0)
        
        let numberFormatter = NumberFormatter()
        numberFormatter.generatesDecimalNumbers = false
        lineChartDataSet.valueFormatter = DefaultValueFormatter(formatter: numberFormatter)
        
        return lineChartDataSet
    }
    
}
