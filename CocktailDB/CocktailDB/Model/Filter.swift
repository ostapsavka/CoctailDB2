//
//  Filter.swift
//  CocktailDB
//
//  Created by Sawka Ostap on 02.07.2020.
//  Copyright © 2020 SavkaOstap. All rights reserved.
//

import Foundation

struct Categories: Codable {
    let drinks: [CategoryDrink]?
}

struct CategoryDrink: Codable {
    let strCategory: String?
}
