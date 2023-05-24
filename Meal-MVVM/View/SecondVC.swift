//
//  SecondVC.swift
//  Meal-MVVM
//
//  Created by Ocean97 on 23/05/2023.
//

import UIKit
import SDWebImage

class SecondVC: UIViewController {

    @IBOutlet weak var mealTable: UITableView!
    
    @IBOutlet weak var drinktable: UITableView!
    
    var viewMealModel = MealViewModel()
    var viewDrinkModel = DrinkViewModel()
    
    var arr_meal: MealModel?
    var meal_diner: Meals?
    var arr_drink: DrinkModel?
    var drink_diner: Drink?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupMealTable()
        setupDrinkTable()
       
    }
    
    
    
    func setupMealTable() {
        if let data_meal = UserDefaults.standard.data(forKey: "Meal") {
            arr_meal = try! PropertyListDecoder().decode(MealModel.self, from: data_meal)
        }
        meal_diner = arr_meal?.meals?.randomElement()
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        mealTable.register(nib, forCellReuseIdentifier: "tableViewCell")
        mealTable.delegate = self
        mealTable.dataSource = self
        mealTable.reloadData()
        
        
    }
    func setupDrinkTable() {
        if let data_drink = UserDefaults.standard.data(forKey: "Drink") {
            arr_drink = try! PropertyListDecoder().decode(DrinkModel.self, from: data_drink)
        }
        drink_diner = arr_drink?.drinks?.randomElement()
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        drinktable.register(nib, forCellReuseIdentifier: "tableViewCell")
        drinktable.delegate = self
        drinktable.dataSource = self
        drinktable.reloadData()
    }

}



extension SecondVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == mealTable {
            return  1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        if tableView == mealTable {
            cell.lbName.text = meal_diner?.strMeal
            if let url = URL(string: "\(meal_diner?.strMealThumb ?? "")") {
                cell.img.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder.png"))
            }
            cell.categories.text =  UserDefaults.standard.string(forKey: "Categories_Meal") ?? ""
        } else {
            cell.lbName.text = drink_diner?.strDrink
            if let url = URL(string: "\(drink_diner?.strDrinkThumb ?? "")") {
                cell.img.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder.png"))
            }
            cell.categories.text =  UserDefaults.standard.string(forKey: "Categories_Drink") ?? ""
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
