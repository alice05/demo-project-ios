//
//  DependencyRegistry.swift
//  demo-project-ios
//
//  Created by Santosh Kc on 2/24/20.
//  Copyright © 2020 Santosh Kc. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

protocol DependencyRegistry {
    var container: Container { get }
    
}

class DependencyRegistryImpl: DependencyRegistry {
    var container: Container
    
    init(container: Container) {
        Container.loggingFunction = nil
        
        self.container = container
    }
    
    func registerDependencies() {
        
    }
}
