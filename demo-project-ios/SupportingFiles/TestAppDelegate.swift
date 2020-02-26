//
//  TestAppDelegate.swift
//  demo-project-ios
//
//  Created by Santosh Kc on 2/20/20.
//  Copyright © 2020 Santosh Kc. All rights reserved.
//

import UIKit

class TestAppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        debugPrint("Running from TestAppDelegate")
        self.window = UIWindow(frame: UIScreen.main.bounds)
        return true
    }
}
