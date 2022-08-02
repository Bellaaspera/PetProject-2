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
    private var petName: String?
    private var petAge: Int?
    private var petBreed: String?
    private var vaccDone: [String]?
    
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

    @IBAction func saveButtonPressed(_ sender: Any) {
        print(isItACat, petName, petAge, petBreed, vaccDone)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vaccTVC = segue.destination as? VacChoserTableViewController else {return}
        if isItACat != false {
            vaccTVC.vaccines = vaccData.catDefaultVacc
        } else {
            vaccTVC.vaccines = vaccData.dogDefaultVacc
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let vacTVC = segue.source as? VacChoserTableViewController else { return }
        vaccDone = vacTVC.selectedVacc
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        textField.inputAccessoryView = keyboardToolbar
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didTapDone)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexBarButton, doneButton]
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
                    cell.petNameField.delegate = self
                    cell.petNameField.tag = indexPath.row
                    return cell
                }
            case .age:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "ageCell", for: indexPath) as? AgeCell {
                    cell.ageField.placeholder = DataStore.AddPetCells.allCases[indexPath.row].rawValue
                    cell.ageField.delegate = self
                    cell.ageField.tag = indexPath.row
                    return cell
                }
            case .breed:
                        if let cell = tableView.dequeueReusableCell(withIdentifier: "breedCell", for: indexPath) as? BreedCell {
                            cell.breedField.placeholder = DataStore.AddPetCells.allCases[indexPath.row].rawValue
                            cell.breedField.delegate = self
                            cell.breedField.tag = indexPath.row
                    return cell
                }
            case .add:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "addCell", for: indexPath) as? AdditionalCell {
                    cell.addLabel.text = DataStore.AddPetCells.allCases[indexPath.row].rawValue
                    return cell
                }
        }
        return UITableViewCell()
    }
    
}

extension AddPetViewController: UITextFieldDelegate, NameCellDelegate, AgeCellDelegate, BreedCellDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.tag {
            case 0:
                petName = textField.text ?? "Unknown pet"
            case 1:
                if let text = Int(textField.text ?? "0") {
                petAge = text
                } else {
                    showAlert(title: "Numbers,", message: "young lady!")
                }
            default:
                petBreed = textField.text ?? "Unbreeded pet"
        }
    }
    
}

extension AddPetViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OKAY😒", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
