//
//  UserModel.swift
//  PetProject
//
//  Created by ikorobov on 01.08.2022.
//

import Foundation

struct User {
    var username: String
    var password: String
//    var pets: [Animal: [Info]] = [:]
        // пробую улучшить
    var pet: PetInfo
    
    static func getUserList() -> [User] {
        let userList: [User] = []
        return userList
    }
}

enum Animal {
    case dog
    case cat
}
struct PetInfo {
    var name: String
    var spicies: Bool
    var age: Int
    var breed: String
    var vaccinations: [String]
}

//struct Info {
//    var name: String = ""
//    var breed: String = ""
//    var age: Int = 0
//    var vaccinations: [String] = []
//}
