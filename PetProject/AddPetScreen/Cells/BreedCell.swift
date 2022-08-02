//
//  BreedCell.swift
//  PetProject
//
//  Created by ikorobov on 01.08.2022.
//

import UIKit

protocol BreedCellDelegate {
    
}

class BreedCell: UITableViewCell, ImFuckingTiredOfProtocol {
    
    @IBOutlet weak var breedField: UITextField!
    @IBOutlet weak var breedPicker: UIPickerView!
    
    private let breedType = DataStore()
    var isCat = true
    var delegate: BreedCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        breedPicker.dataSource = self
        breedPicker.delegate = self
        breedField.inputView = breedPicker
        
    }
    
}

extension BreedCell: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if isCat != false {
           return breedType.catBreed.count
        } else {
           return breedType.dogBreed.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if isCat != false {
           return breedType.catBreed[row]
        } else {
           return  breedType.dogBreed[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if isCat != false {
            breedField.text = breedType.catBreed[row]
        } else {
            breedField.text = breedType.dogBreed[row]
        }
    }
    
}
