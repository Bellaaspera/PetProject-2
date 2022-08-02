//
//  DataStore.swift
//  PetProject
//
//  Created by ikorobov on 01.08.2022.
//

import Foundation

class DataStore {
    let catDefaultVacc = ["It wasn't me vac", "Go vac yourself!", "Is it covid again?"]
    let dogDefaultVacc = ["Good boy vac", "Can i get some food?","Woof-woof Vac"]
    let catBreed = ["Who","lives", "in pineapple", "under the sea?"]
    let dogBreed = ["Good boy", "Very good boy", "Not that good", "one"]
    
    enum AddPetCells: String, CaseIterable {
        case name = "Pet's name"
        case age = "Pet's age"
        case breed = "Pet's breed"
        case add = "Additional"
    }
}
