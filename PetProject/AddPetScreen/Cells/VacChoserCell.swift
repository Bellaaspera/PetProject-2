//
//  VacChoserCell.swift
//  PetProject
//
//  Created by ikorobov on 01.08.2022.
//

import UIKit

class VacChoserCell: UITableViewCell {
    
    @IBOutlet weak var vaccNameLabel: UILabel!
    @IBOutlet weak var vaccSwitch: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func switchPressed(_ sender: UISwitch) {
        print((vaccNameLabel.text ?? "Нихуя") + " switch is " + (sender.isOn ? "ON" : "OFF"))
        guard let vaccVC = UITableViewController() as? VacChoserTableViewController else { return }
        vaccVC.selectedVacc.append(vaccNameLabel.text ?? "Ничего не пришло")
        print(vaccVC.selectedVacc)
        
    }

}
