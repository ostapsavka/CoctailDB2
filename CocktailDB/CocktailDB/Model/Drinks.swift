//
//  Drinks.swift
//  CocktailDB
//
//  Created by Sawka Ostap on 30.06.2020.
//  Copyright © 2020 SavkaOstap. All rights reserved.
//

import Foundation

struct Drinks: Codable {
    let drinks: [Drink]?
}

class Drink: Codable {
    let strDrink: String?
    let strDrinkThumb: String?
    let idDrink: String?
    var strCategory: String?
    

}




