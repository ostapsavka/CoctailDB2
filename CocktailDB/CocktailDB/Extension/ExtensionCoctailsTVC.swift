//
//  ExtensionCoctailsTVC.swift
//  CocktailDB
//
//  Created by Sawka Ostap on 02.07.2020.
//  Copyright © 2020 SavkaOstap. All rights reserved.
//

import UIKit

extension CoctailsTableViewController {
    func getCocktailes() {
           let urlStr = "https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list"
           guard let url = URL(string: urlStr) else { return }
           
           URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
               guard let data = data else { return }
               do {
                   let categories = try JSONDecoder().decode(Categories.self, from: data)
                   if let categories = categories.drinks {
                       self?.categories = categories
            
                       for i in categories{
                           let categoryName = i.strCategory
                           guard let category = categoryName?.split(separator: " ").joined(separator: "%20") else { return }
                           let urlStr = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=\(category)"
                           guard let url = URL(string: urlStr) else { return }
                           
                           
                           URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
                               guard let data = data else { return }
                               do {
                                   let drinks = try JSONDecoder().decode(Drinks.self, from: data)
                                   if let drinks = drinks.drinks {
                                    drinks.forEach({ $0.strCategory = categoryName})
                                       self?.filteredDrinks.append(contentsOf: drinks)
                                       DispatchQueue.main.async {
                                           self?.tableView.reloadData()
                                       }
                                   }
                               }
                               catch {
                                   print(error.localizedDescription)
                               }
                           }.resume()
                       }
                   }
               }
               catch {
                   print(error.localizedDescription)
               }
           }.resume()
       }
}
