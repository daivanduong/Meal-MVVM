//
//  MealModel.swift
//  Meal-MVVM
//
//  Created by Ocean97 on 22/05/2023.
//

import Foundation


struct CategoriesMeal: Codable {
    var categories: [Categories]?
}

struct Categories: Codable {
    var idCategory: String?
    var strCategory: String?
    var strCategoryThumb: String?
    var strCategoryDescription: String?
}

struct MealModel: Codable {
    var meals: [Meals]?
}

struct Meals: Codable {
    var strMeal: String
    var strMealThumb: String
    var idMeal: String

}

