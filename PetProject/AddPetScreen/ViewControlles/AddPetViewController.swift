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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        petImage.image = UIImage(named: "defaultImage")
    }
    
    @IBAction func petSelected(_ sender: UISegmentedControl) {
        switch petSelector.selectedSegmentIndex {
            case 0:
                petImage.image = UIImage(named: "catImage")
            default:
                petImage.image = UIImage(named: "dogImage")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
                    return cell
                }
            case .age:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "ageCell", for: indexPath) as? AgeCell {
                    return cell
                }
            case .breed:
                        if let cell = tableView.dequeueReusableCell(withIdentifier: "breedCell", for: indexPath) as? BreedCell {
                    return cell
                }
            case .add:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "addCell", for: indexPath) as? AdditionalCell {
                    return cell
                }
        }
        return UITableViewCell()
    }
    
    
}
