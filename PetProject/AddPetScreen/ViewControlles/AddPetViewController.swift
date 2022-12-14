//
//  AddPetViewController.swift
//  PetProject
//
//  Created by ikorobov on 01.08.2022.
//

import UIKit

protocol BreedDataSend {
    func passBreedData() -> [String]
}

class AddPetViewController: UIViewController, UIPickerViewDelegate {

    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var petSelector: UISegmentedControl!
    @IBOutlet weak var settings: UITableView!
    
    private let petData = DataStore()
    private var petList = Pet.getPetList()
    private var vaccList: [String]?
    var breeds: [String]?
    var delegate: BreedDataSend?
    
    
    private var isItACat: AnymalType?
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
                isItACat = .cat
                breeds = petData.catBreed
                vaccList = petData.catDefaultVacc
                delegate?.passBreedData()
                settings.reloadData()
                print(breeds)
                petImage.image = UIImage(named: "catImage")
                
            default:
                isItACat = .dog
                breeds = petData.dogBreed
                vaccList = petData.dogDefaultVacc
                settings.reloadData()
                print(breeds)
                petImage.image = UIImage(named: "dogImage")
                
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        getPet()
        print(petList)
    }
    
    func passBreedData() -> [String] {
        return self.breeds ?? ["Oh"]
    }
    
    private func getPet() {
        
        var pet = Pet(animalType: isItACat ?? .cat)
        pet.name = petName ?? "something wrong"
        pet.age = petAge ?? 0
        pet.breed = petBreed ?? "check your dev,dude!"
        pet.vaccinations = vaccDone ?? [""]
        petList.append(pet)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vaccTVC = segue.destination as? VacChoserTableViewController else {return}
        
            vaccTVC.vaccines = vaccList
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
        
        let set = DataStore.AddPetCells.allCases[indexPath.row]
        
        switch set {
                
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
                    cell.breed1?.passBreedData()

                    
                    
 
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
// more delegates to the god of delegates!
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
        let okAction = UIAlertAction(title: "OKAY????", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

