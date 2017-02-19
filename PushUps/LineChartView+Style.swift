//
//  LineChartView+Style.swift
//  PushUps
//
//  Created by Andrew Walker on 19/02/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import Charts

internal extension LineChartView {
    
    // MARK: - Internal Functions
    
    internal func applyGlobalStyle() {
        self.backgroundColor = UIColor.clear
        self.drawGridBackgroundEnabled = false
        self.rightAxis.enabled = false
        self.leftAxis.enabled = false
        self.xAxis.enabled = false
        self.doubleTapToZoomEnabled = false
        self.dragEnabled = false
        self.noDataText = ""
        self.legend.enabled = false
        self.chartDescription = nil
        self.highlighter = nil
        self.setViewPortOffsets(left: 20.0, top: 20.0, right: 20.0, bottom: 20.0)
    }
    
}
