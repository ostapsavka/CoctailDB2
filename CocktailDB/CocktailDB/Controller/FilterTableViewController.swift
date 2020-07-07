//
//  FilterTableViewController.swift
//  CocktailDB
//
//  Created by Sawka Ostap on 01.07.2020.
//  Copyright © 2020 SavkaOstap. All rights reserved.
//

import UIKit

protocol FilterTableViewControllerDelegate: class {
    func getSelectedCategories(_ selectedCategories: [CategoryDrink])
}

class FilterTableViewController: UITableViewController {

    
    @IBOutlet weak var applyButton: UIBarButtonItem!
    
    weak var delegate: FilterTableViewControllerDelegate?
    
    var newDrinksList: [Drink] = []
    var categories: [CategoryDrink] = []
    
    var selectedCategories: [CategoryDrink] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyButton.isEnabled = false
    }
    
    @IBAction func applyButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            self.delegate?.getSelectedCategories(self.selectedCategories)
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! FiltersTableViewCell
        
        if cell.checkmarkButton.isSelected {
            applyButton.isEnabled = false
            selectedCategories.remove(at: indexPath.row)
            cell.checkmarkButton.isSelected = false
        } else {
            cell.checkmarkButton.isSelected = true
            selectedCategories.append(categories[indexPath.row])
            applyButton.isEnabled = true
        }
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath) as! FiltersTableViewCell
        cell.label.text = categories[indexPath.row].strCategory
        return cell
    }
}
