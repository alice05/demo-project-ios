//
//  SpyTranslatorTests.swift
//  demo-project-iosTests
//
//  Created by Santosh Kc on 2/20/20.
//  Copyright © 2020 Santosh Kc. All rights reserved.
//

import XCTest
import  Swinject
import CoreData

@testable import demo-project-ios

class SpyTranslatorTests : XCTestCase {
    
    var sut: SpyTranslatorIml!
    private var managedObjectContext: NSManagedObjectContext!
    
    override func setUp() {
        let container = self.setupDependencies()
        sut = container.resolve(SpyTranslator.self) as? SpyTranslatorIml
        managedObjectContext = Helper().setUpInMemoryManagedObjectContext()
    }
    
    func test_codableSpy_isCorrectlyTranslated_ToLocalSpy() {
        let decodableSpy = CodableSpyDTO(isIncognito: false, age: 12, gender: .female, password: "mypassword", imageName: "profile")
        let localSpy = sut.translate(from: decodableSpy, with: managedObjectContext)
        XCTAssertTrue(decodableSpy.isEqualTo(localSpy: localSpy))
    }
    
    func test_localSpy_isCorrectlyTranslated_ToCodableSpy() {
        let localSpy = LocalSpy(context: managedObjectContext)
        localSpy.age = 18
        localSpy.name = "Elexa"
        localSpy.gender = "female"
        localSpy.isIncognito = true
        localSpy.password = "strongpass"
        localSpy.imageName = "myImage"
        
        let codableSpy = sut.translate(from: localSpy)
        XCTAssertTrue(codableSpy.isEqualTo(localSpy: localSpy))
    }
    
    override func tearDown() {
        sut = nil
    }
}

extension SpyTranslatorTests {
    func setupDependencies() -> Container {
        let container = Container()
        container.register(SpyTranslator.self) { _ in SpyTranslatorIml()}.inObjectScope(.container)
        return container
    }
}

extension CodableSpyDTO {
    func isEqualTo(localSpy: LocalSpy) -> Bool {
        return
                localSpy.age == self.age &&
                    localSpy.gender == self.gender?.rawValue && localSpy.imageName == self.imageName && localSpy.password == self.password && localSpy.isIncognito == self.isIncognito
    }
}
