//
//  SpyTranslator.swift
//  demo-project-ios
//
//  Created by Santosh Kc on 2/20/20.
//  Copyright © 2020 Santosh Kc. All rights reserved.
//

import Foundation
import  CoreData

protocol SpyTranslator {
    func translate(from codableSpy: CodableSpyDTO, with managedContext: NSManagedObjectContext) -> LocalSpy
    func translate(from localSpy: LocalSpy) -> CodableSpyDTO
}

class SpyTranslatorIml: SpyTranslator {
    func translate(from localSpy: LocalSpy) -> CodableSpyDTO {
        return CodableSpyDTO(isIncognito: localSpy.isIncognito, age: Int(localSpy.age), gender: Gender(rawValue: localSpy.gender ?? ""), password: localSpy.password, imageName: localSpy.imageName)
    }
    
    func translate(from codableSpy: CodableSpyDTO, with managedContext: NSManagedObjectContext) -> LocalSpy {
        let localSpy = LocalSpy(context: managedContext)
        localSpy.age = Int64(codableSpy.age)
        localSpy.name = codableSpy.name
        localSpy.gender = codableSpy.gender?.rawValue
        localSpy.isIncognito = codableSpy.isIncognito
        localSpy.password = codableSpy.password
        localSpy.imageName = codableSpy.imageName
        return localSpy
    }
    
    
}
