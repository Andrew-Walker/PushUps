//
//  WorkoutChartViewController.swift
//  PushUps
//
//  Created by Andrew Walker on 18/02/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit
import Charts

internal final class WorkoutChartViewController: UIViewController, WorkoutChartViewControllerProxyDelegate {
    
    // MARK: - Private Properties
    
    @IBOutlet private weak var lineChartView: LineChartView!
    
    // MARK: - Internal Properties
    
    internal var proxy: WorkoutChartViewControllerProxy?
    
    // MARK: - Lifecycle
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        self.proxy = WorkoutChartViewControllerProxy(delegate: self)
        
        self.styleUI()
        self.configureUI()
    }
    
    internal override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.configureLineChartView()
    }
    
    // MARK: - UI
    
    private func styleUI() {
        self.view.backgroundColor = UIColor.clear
        self.lineChartView.applyGlobalStyle()
    }
    
    private func configureUI() {
        self.lineChartView.delegate = self
    }
    
    private func configureLineChartView() {
        guard let completedWorkoutSessions = self.proxy?.completedWorkoutSessions(), !completedWorkoutSessions.isEmpty else {
            self.lineChartView.isHidden = true
            return
        }
        
        self.lineChartView.isHidden = false
        self.lineChartView.data = WorkoutChartChartDataSetFactory.createLineChartData(from: completedWorkoutSessions)
    }
    
}

extension WorkoutChartViewController: ChartViewDelegate {
    
}
