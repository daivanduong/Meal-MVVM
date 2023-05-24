//
//  CategriesMealViewModel.swift
//  Meal-MVVM
//
//  Created by Ocean97 on 22/05/2023.
//

import Foundation

class CategriesMealViewModel {
    private let urlApi = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php")!
    var categoriesMeal: CategoriesMeal?
    
    func getDataAPICategoriesMeal(completion: @escaping () -> ()) {
        URLSession.shared.dataTask(with: urlApi) { [weak self] data, reponse, error in
            if let data = data {
                let categoriesData = try! JSONDecoder().decode(CategoriesMeal.self, from: data)
                self?.categoriesMeal = categoriesData
                completion()
                
            }
        }.resume()
    }
}
