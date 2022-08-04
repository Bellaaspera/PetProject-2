//
//  BreedCell.swift
//  PetProject
//
//  Created by ikorobov on 01.08.2022.
//

import UIKit

protocol BreedCellDelegate {
    
}

class BreedCell: UITableViewCell, BreedDataSend {

    
    
    @IBOutlet weak var breedField: UITextField!
    @IBOutlet weak var breedPicker: UIPickerView!
    
    private let breedType = DataStore()
    var breed1: BreedDataSend?
    private var breed: [String]? {
        didSet {
            print(breed)
        }
    }
    var delegate: BreedCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        breedPicker.dataSource = self
        breedPicker.delegate = self
        breedField.inputView = breedPicker
        passBreedData()
        
        
    }

    
    func passBreedData()-> [String]{
        if let breedIncome = breed1?.passBreedData(){
            self.breed = breedIncome
            print(breed ?? "Nope")
        }
        return breed ?? ["Second retrun"]
    }
    

    
}

extension BreedCell: UIPickerViewDataSource, UIPickerViewDelegate {
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        return breed?.count ?? 1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
       return breed?[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        breedField.text = breed?[row]
        print(breed)
    }

}

