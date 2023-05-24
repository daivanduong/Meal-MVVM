//
//  CategoriesMealModel.swift
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


