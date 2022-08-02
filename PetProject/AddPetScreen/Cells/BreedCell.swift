//
//  BreedCell.swift
//  PetProject
//
//  Created by ikorobov on 01.08.2022.
//

import UIKit

protocol BreedCellDelegate {
    
}

class BreedCell: UITableViewCell {
    
    @IBOutlet weak var breedField: UITextField!
    @IBOutlet weak var breedPicker: UIPickerView!

    private let breedType = DataStore()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        breedPicker.dataSource = self
        breedPicker.delegate = self
        breedField.inputView = breedPicker
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}

extension BreedCell: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    //Обратить внимание, как отличать собак от кошек
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        breedType.catBreed.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        breedType.catBreed[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        breedField.text = breedType.catBreed[row]
    }
    
}
