//
//  Helper.swift
//  PersonalProjectTests
//
//  Created by Santosh Kc on 2/25/20.
//  Copyright © 2020 Santosh Kc. All rights reserved.
//

import Foundation
import CoreData

class Helper {
     func setUpInMemoryManagedObjectContext() -> NSManagedObjectContext {
        let managedObjectModel = NSManagedObjectModel.mergedModel(from: [Bundle.main])
        let persistentStateCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel!)
        do {
            try persistentStateCoordinator.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: nil, options: nil)
        } catch {
            fatalError()
        }
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = persistentStateCoordinator
        return managedObjectContext
    }
}
