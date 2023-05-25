//
//  DrinkViewModel.swift
//  Meal-MVVM
//
//  Created by Ocean97 on 23/05/2023.
//

import Foundation

class DrinkViewModel {
    
    var categoriesDink = [DrinkCategories]()
    var drinkModel: DrinkModel?
    
    
    func getDataDrink(completion: @escaping () -> ()) {
        let categories = [DrinkCategories(idDrink: 1, nameDrink: "Cocktail"), DrinkCategories(idDrink: 2, nameDrink: "Shot"),DrinkCategories(idDrink: 3, nameDrink: "Shake"),DrinkCategories(idDrink: 4, nameDrink: "Cocoa"), DrinkCategories(idDrink: 5, nameDrink: "Beer"), DrinkCategories(idDrink: 6, nameDrink: "Ordinary_Drink")]
        
        self.categoriesDink = categories
    }
    

    func generateDrink (key: String) {
        URLSession.shared.dataTask(with: URL(string: "https:www.thecocktaildb.com/api/json/v1/1/filter.php?c=\(key)")!) { [weak self] data, response , error in
            if let data = data {
                let drinkData = try! JSONDecoder().decode(DrinkModel?.self, from: data)
                self?.drinkModel = drinkData
              
            }
            UserDefaults.standard.set(try? PropertyListEncoder().encode(self?.drinkModel), forKey: "Drink")
            UserDefaults.standard.set(key, forKey: "Categories_Drink")
        } .resume()
        
    }  
    
}

