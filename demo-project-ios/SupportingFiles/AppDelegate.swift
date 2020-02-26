//
//  AppDelegate.swift
//  demo-project-ios
//
//  Created by Santosh Kc on 2/12/20.
//  Copyright © 2020 Santosh Kc. All rights reserved.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    static var dependencyRegistry: DependencyRegistry!
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        debugPrint("Running from AppDelegate")
        return true
    }
}

