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
    var isCat: Bool
    var name: String = ""
    var breed: String = ""
    var age: Int = 0
    var vaccinations: [String] = []
    
    static func getPetList() -> [Pet] {
        var petList: [Pet] = []
        return petList
    }
}


