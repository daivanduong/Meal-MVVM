//
//  DrinkModel.swift
//  Meal-MVVM
//
//  Created by Ocean97 on 23/05/2023.
//

import Foundation


struct DrinkCategories {
    let idDrink: Int
    let nameDrink: String
    
    init(idDrink: Int, nameDrink: String) {
        self.idDrink = idDrink
        self.nameDrink = nameDrink
    }
}


struct DrinkModel: Codable {
  
    var drinks: [Drink]?
    
}

struct Drink: Codable {
    var strDrink: String
    var strDrinkThumb: String
    var idDrink: String

}
