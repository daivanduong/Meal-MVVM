//
//  MealViewModel.swift
//  Meal-MVVM
//
//  Created by Ocean97 on 22/05/2023.
//

import Foundation

class MealViewModel {
    
    var mealModel: MealModel?

    func generateMeal (key: String) {
        URLSession.shared.dataTask(with: URL(string: "https:www.themealdb.com/api/json/v1/1/filter.php?c=\(key)")!) { [weak self] data, response , error in
            if let data = data {
                let mealData = try! JSONDecoder().decode(MealModel.self, from: data)
                self?.mealModel = mealData
              
            }
            UserDefaults.standard.set(try? PropertyListEncoder().encode(self?.mealModel), forKey: "Meal")
            UserDefaults.standard.set(key, forKey: "Categories_Meal")
            print(self!.mealModel?.meals?.count ?? 0)
        } .resume()
        
        
        
    }

}

