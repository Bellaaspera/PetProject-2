//
//  AddPetViewController.swift
//  PetProject
//
//  Created by ikorobov on 01.08.2022.
//

import UIKit

class AddPetViewController: UIViewController {
    
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var petSelector: UISegmentedControl!
    @IBOutlet weak var settings: UITableView!
    
    private let vaccData = DataStore()
    private var isItACat: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        petImage.image = UIImage(named: "defaultImage")
    }
    
    @IBAction func petSelected(_ sender: UISegmentedControl) {
        switch petSelector.selectedSegmentIndex {
            case 0:
                isItACat = true
                petImage.image = UIImage(named: "catImage")
            default:
                isItACat = false
                petImage.image = UIImage(named: "dogImage")
                
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vaccTVC = segue.destination as? VacChoserTableViewController else {return}
        if isItACat != false {
            vaccTVC.vaccines = vaccData.catDefaultVacc
        } else {
            vaccTVC.vaccines = vaccData.dogDefaultVacc
        }
    }

}

extension AddPetViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataStore.AddPetCells.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let settings = DataStore.AddPetCells.allCases[indexPath.row]
    
        switch settings {
                
            case .name:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath) as? NameCell {
                    cell.petNameField.placeholder = DataStore.AddPetCells.allCases[indexPath.row].rawValue
                    return cell
                }
            case .age:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "ageCell", for: indexPath) as? AgeCell {
                    cell.ageField.placeholder = DataStore.AddPetCells.allCases[indexPath.row].rawValue
                    return cell
                }
            case .breed:
                        if let cell = tableView.dequeueReusableCell(withIdentifier: "breedCell", for: indexPath) as? BreedCell {
                            cell.breedField.placeholder = DataStore.AddPetCells.allCases[indexPath.row].rawValue
                    return cell
                }
            case .add:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "addCell", for: indexPath) as? AdditionalCell {
                    var content = cell.defaultContentConfiguration()
                    content.text = DataStore.AddPetCells.allCases[indexPath.row].rawValue
                    return cell
                }
        }
        return UITableViewCell()
    }
    
    
}
