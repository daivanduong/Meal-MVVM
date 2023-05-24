//
//  MealModel.swift
//  Meal-MVVM
//
//  Created by Ocean97 on 22/05/2023.
//

import Foundation
import HandyJSON



struct MealModel: Codable {
  
    var meals: [Meals]?
    
}

struct Meals: Codable {
    var strMeal: String
    var strMealThumb: String
    var idMeal: String

}

