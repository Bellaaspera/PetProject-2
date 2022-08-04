//
//  UserModel.swift
//  PetProject
//
//  Created by ikorobov on 01.08.2022.
//

import Foundation


struct User {
    var data: [String: [Pet]]
    
    static func getUserList() -> [User] {
        var userList: [User] = []
        return userList
    }
}

struct Pet {
    var animalType: AnymalType
    var name: String = ""
    var breed: String = ""
    var age: Int = 0
    var vaccinations: [String] = []
    
    static func getPetList() -> [Pet] {
        var petList: [Pet] = []
        return petList
    }
}

enum AnymalType {
    case cat
    case dog
}

//
//struct User {
//    var username: String
//    var password: String
////    var pets: [Animal: [Info]] = [:]
//        // пробую улучшить
//    var pet: PetInfo
//
//    static func getUserList() -> [User] {
//        let userList: [User] = []
//        return userList
//    }
//}
//
//enum Animal {
//    case dog
//    case cat
//}
//struct PetInfo {
//    var name: String
//    var spicies: Bool
//    var age: Int
//    var breed: String
//    var vaccinations: [String]
//}

//struct Info {
//    var name: String = ""
//    var breed: String = ""
//    var age: Int = 0
//    var vaccinations: [String] = []
//}
