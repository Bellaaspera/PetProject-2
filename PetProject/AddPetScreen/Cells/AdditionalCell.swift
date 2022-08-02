//
//  AdditionalCell.swift
//  PetProject
//
//  Created by ikorobov on 01.08.2022.
//

import UIKit

class AdditionalCell: UITableViewCell {
    
    @IBOutlet weak var addLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .gray
        accessoryType = .disclosureIndicator
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
