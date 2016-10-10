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
        temporaryUser.currentSessionIDs = ("e7baafb6-23b9-47f2-8eef-81beeef600b7", "ed5b2590-a284-4b3d-bf87-5b7848cb7b4c")
        UserController.sharedInstance.setUser(user: temporaryUser)
    }
    
    private func loadSessions() {
        SessionController.sharedInstance.loadAllLevels()
    }
    
}

