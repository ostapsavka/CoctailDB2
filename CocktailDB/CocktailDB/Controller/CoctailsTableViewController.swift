//
//  CoctailsTableViewController.swift
//  CocktailDB
//
//  Created by Sawka Ostap on 30.06.2020.
//  Copyright © 2020 SavkaOstap. All rights reserved.
//

import UIKit

class CoctailsTableViewController: UITableViewController {

    // MARK: - Properties
    var categories = Array<CategoryDrink>()
    var currentDrinks = Array<Drink>()
    
    var filteredCategories = Array<CategoryDrink>()
    var filteredDrinks = Array<Drink>()
    
    // MARK: - ViewController's lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getCocktailes()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredDrinks.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CoctailTableViewCell
        let eachDrink = filteredDrinks[indexPath.row]
        
        cell.nameLabel.text = eachDrink.strDrink
        
        if let urlString = filteredDrinks[indexPath.row].strDrinkThumb,
            let imageUrl = URL(string: urlString),
            let data = try? Data(contentsOf: imageUrl) {
            cell.coctailImage.image = UIImage(data: data)
        }
        
        return cell
    }
    
    @IBAction func backActoion(_ segue: Any) {
        dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "showFilters",
            let navigationController = segue.destination as? UINavigationController,
            let filterViewController = navigationController.topViewController as? FilterTableViewController {
            filterViewController.categories = categories
            filterViewController.delegate = self
        }
    }
}

extension CoctailsTableViewController: FilterTableViewControllerDelegate {
    func getSelectedCategories(_ selectedCategories: [CategoryDrink]) {
        let filter = selectedCategories.map { $0.strCategory }
        let filteredArray = filteredDrinks.filter { filter.contains($0.strCategory)}
        filteredDrinks = filteredArray
        tableView.reloadData()
    }
}
