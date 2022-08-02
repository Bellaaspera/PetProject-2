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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
