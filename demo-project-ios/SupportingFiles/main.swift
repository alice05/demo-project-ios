//
//  main.swift
//  demo-project-ios
//
//  Created by Santosh Kc on 2/20/20.
//  Copyright © 2020 Santosh Kc. All rights reserved.
//

import UIKit

let isRunningTests = NSClassFromString("XCTestCase") != nil
let appDelegateClass: AnyClass = isRunningTests ? TestAppDelegate.self : AppDelegate.self

UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(appDelegateClass))
