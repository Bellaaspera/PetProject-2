//
//  VacChoserTableViewController.swift
//  PetProject
//
//  Created by ikorobov on 01.08.2022.
//

import UIKit

class VacChoserTableViewController: UITableViewController, VacChoserCellDelegate {
    
    var vaccines: [String]!
    var selectedVacc: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func switchPressed(_ sender: UISwitch, cell: VacChoserCell) {
        guard let indexPath = self.tableView.indexPath(for: cell) else { return }
        if cell.vaccSwitch.isOn {
            
            selectedVacc.append(cell.vaccNameLabel.text ?? "something wrong")
            print(indexPath.row)
            print(selectedVacc)
        } else {
            if let toRemove = cell.vaccNameLabel.text {
                selectedVacc.removeAll(where: { toRemove.contains($0)})
                print(selectedVacc)
            } else {
                return
            }
        }
        
    }
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        vaccines.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "vaccCell", for: indexPath) as? VacChoserCell {
            cell.delegate = self
            cell.vaccNameLabel.text = vaccines[indexPath.row]
            
            return cell
        }
        return UITableViewCell()
    }
    
    private func crutch() {
        let crutch = [String](repeatElement("", count: vaccines.count))
        selectedVacc = crutch
    }
    
}
