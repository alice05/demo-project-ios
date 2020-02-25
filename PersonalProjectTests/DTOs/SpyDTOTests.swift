//
//  SpyDTOTests.swift
//  PersonalProjectTests
//
//  Created by Santosh Kc on 2/13/20.
//  Copyright © 2020 Santosh Kc. All rights reserved.
//

import XCTest
@testable import PersonalProject

class SpyDTOTests: XCTestCase {
    
    func testCodableDTOIsParsedCorrectly() {
        let json = """
                {
                    "age": 28,
                    "gender": "male",
                    "password": "mypassword",
                    "imageName": "default.png",
                    "isIncognito": true
                }
        """.data(using: .utf8)!
        let dto = try! JSONDecoder().decode(CodableSpyDTO.self
            , from: json)
        XCTAssertEqual(dto.age, 28)
        XCTAssertEqual(dto.gender, Gender(rawValue: "male"))
        XCTAssertEqual(dto.password, "mypassword")
        XCTAssertEqual(dto.imageName, "default.png")
        XCTAssertGreaterThan(dto.name.count, 0)
    }
    
    
}
