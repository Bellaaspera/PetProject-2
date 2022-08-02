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
    
    enum AddPetCells: String, CaseIterable {
        case name = "Имя животного"
        case age = "Возраст"
        case breed = "Порода"
        case add = "Дополнительно"
    }
}
