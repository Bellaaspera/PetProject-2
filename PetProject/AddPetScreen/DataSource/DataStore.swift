//
//  DataStore.swift
//  PetProject
//
//  Created by ikorobov on 01.08.2022.
//

import Foundation

class DataStore {
    let catDefaultVacc = ["Вакцинка", "Вакциночка", "Справочка"]
    let dogDefaultVacc = ["Ошейник", "Мисочка","Переноска"]
    let catBreed = ["Кот Баюн","Председатель Мяу", "Дворовый бандит"]
    let dogBreed = ["Борзая", "Скромная", "Умеренная"]
    
    enum AddPetCells: CaseIterable {
        case name
        case age
        case breed
        case add
    }
}
