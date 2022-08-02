//
//  NameCell.swift
//  PetProject
//
//  Created by ikorobov on 01.08.2022.
//

import UIKit

protocol NameCellDelegate {
    
}

class NameCell: UITableViewCell {
    
    @IBOutlet weak var petNameField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
