//
//  AgeCell.swift
//  PetProject
//
//  Created by ikorobov on 01.08.2022.
//

import UIKit

protocol AgeCellDelegate {
    
}

class AgeCell: UITableViewCell {
    
    @IBOutlet weak var ageField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ageField.keyboardType = .numberPad
    }
    
}
