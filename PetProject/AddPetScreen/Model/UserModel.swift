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
    var pets: [Animal: [Info]] = [:]
    
    static func getUserList() -> [User] {
        let userList: [User] = []
        return userList
    }
}

enum Animal {
    case dog
    case cat
}

struct Info {
    var name: String = ""
    var breed: String = ""
    var age: Int = 0
    var vaccinations: [String] = []
}
