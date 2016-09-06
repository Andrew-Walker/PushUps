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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.styleUI()
        self.configureTemporaryUser()
        
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
        let temporaryUser = PushUpUser(name: "Andrew Walker")
        UserManager.sharedInstance.setUser(user: temporaryUser)
    }
    
}

