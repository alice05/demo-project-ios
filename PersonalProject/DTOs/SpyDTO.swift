//
//  SpyDTO.swift
//  PersonalProject
//
//  Created by Santosh Kc on 2/12/20.
//  Copyright © 2020 Santosh Kc. All rights reserved.
//

import Foundation

private var numImagesPerGender = 6

protocol SpyDTO {
    var age: Int { get set }
    var name: String { get }
    var gender: Gender? { get set }
    var password: String? { get set }
    var imageName: String? { get set }
    var isIncognito: Bool { get set }
}

struct CodableSpyDTO: SpyDTO, Decodable {
    var isIncognito: Bool
    
    var age: Int
    
    var name: String {
        return randomImageName
    }
    
    var gender: Gender?
    
    var password: String?
    
    var imageName: String?
    
    enum CodingKeys: String, CodingKey {
        case age
        case gender
        case password
        case imageName
        case isIncognito
    }
    
    private var randomImageName: String {
        let imageIndex = Int(arc4random_uniform(UInt32(numImagesPerGender))) + 1
        let imageGender = gender == .female ? "F"
            : "M"
        
        return String(format: "Spy%@%02d", imageGender, imageIndex)
    }
}

enum Gender: String, Decodable {
    case male,
    female
}

extension CodableSpyDTO: Equatable {
    static func ==(lhs: CodableSpyDTO, rhs: CodableSpyDTO) -> Bool {
        return
            lhs.age == rhs.age &&
                lhs.gender?.rawValue == rhs.gender?.rawValue &&
                lhs.password == rhs.password &&
                lhs.isIncognito == rhs.isIncognito
    }
}
