//
//  AppDelegate.swift
//  PushUps
//
//  Created by Andrew Walker on 11/07/2016.
//  Copyright © 2016 Andrew Walker. All rights reserved.
//

import UIKit

@UIApplicationMain
internal final class AppDelegate: UIResponder, UIApplicationDelegate {
    
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
        UIApplication.applyGlobalStyle()
        UINavigationBar.applyGlobalStyle()
        UIBarButtonItem.applyGlobalStyle()
    }
    
    private func configureTemporaryUser() {
        var temporaryUser = PushUpUser(name: "Andrew Walker")
        temporaryUser.set(levelID: "e7baafb6-23b9-47f2-8eef-81beeef600b7", stageID: "d92bc1e1-6501-4090-bb88-6c10907e8de9")
        UserController.sharedInstance.set(user: temporaryUser)
    }
    
    private func loadSessions() {
        SessionController.sharedInstance.loadAllLevels()
    }
    
}

