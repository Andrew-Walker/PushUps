//
//  AppDelegate.swift
//  PushUps
//
//  Created by Andrew Walker on 11/07/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        self.styleUI()
        self.configureTemporaryUser()
        self.loadSessions()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    
    private func styleUI() {
        UIApplication.applyGlobalStatusBarStyle()
        UINavigationBar.applyGlobalNavigationBarStyle()
        UIBarButtonItem.applyGlobalBarButtonStyle()
    }
    
    private func configureTemporaryUser() {
        var temporaryUser = PushUpUser(name: "Andrew Walker")
        temporaryUser.set(levelID: "9d01f269-0f00-4395-a868-c66fd76a2460", stageID: "1ca45734-01d4-497d-8f95-6c9f153ec3c5")
        UserController.sharedInstance.setUser(user: temporaryUser)
    }
    
    private func loadSessions() {
        SessionController.sharedInstance.loadAllLevels()
    }
    
}

