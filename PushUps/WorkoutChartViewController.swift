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
    
    @IBOutlet private weak var personalBestLabel: UILabel!
    @IBOutlet private weak var dashedLineView: UIView!
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
        
        let personalBestIndicatorColor = UIColor.black.withAlphaComponent(0.15)
        self.personalBestLabel.textColor = personalBestIndicatorColor
        self.dashedLineView.addDashedLine(color: personalBestIndicatorColor)
    }
    
    private func configureUI() {
        self.lineChartView.delegate = self
    }
    
    private func configureLineChartView() {
        guard let completedWorkoutSessions = self.proxy?.completedWorkoutSessions(), completedWorkoutSessions.count > 1 else {
            self.view.isHidden = true
            return
        }
        
        self.view.isHidden = false
        self.lineChartView.data = WorkoutChartChartDataSetFactory.createLineChartData(from: completedWorkoutSessions)
    }
    
}

extension WorkoutChartViewController: ChartViewDelegate {
    
}
