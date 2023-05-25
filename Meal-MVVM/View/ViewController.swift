//
//  ViewController.swift
//  Meal-MVVM
//
//  Created by Ocean97 on 22/05/2023.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var collectionViewMeal: UICollectionView!
    @IBOutlet weak var collectionViewDrink: UICollectionView!
    
    
    @IBOutlet weak var generateBT: UIButton!
    
    var categoriesMealData: CategoriesMeal?
    var viewModelMeal = MealViewModel()
    var viewModeDrink = DrinkViewModel()
    var mealSelect = false
    var drinkSelect = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupCollectionMeal()
        setupCollectionDrink()
        setupButton()
    }
    
    func setupCollectionMeal() {
        viewModelMeal.getDataAPICategoriesMeal { [weak self] in
            self?.categoriesMealData = self?.viewModelMeal.categoriesMeal
            DispatchQueue.main.async {
                let nib = UINib(nibName: "CategoriesViewCell", bundle: nil)
                self?.collectionViewMeal.register(nib, forCellWithReuseIdentifier: "categoriesViewCell")
                self?.collectionViewMeal.delegate = self
                self?.collectionViewMeal.dataSource = self
                self?.collectionViewMeal.reloadData()
            }
            
        }
        
    }
    
    func setupCollectionDrink() {
        
        viewModeDrink.getDataDrink {}
        let nib = UINib(nibName: "CategoriesViewCell", bundle: nil)
        collectionViewDrink.register(nib, forCellWithReuseIdentifier: "categoriesViewCell")
        collectionViewDrink.delegate = self
        collectionViewDrink.dataSource = self
        collectionViewDrink.reloadData()
    
    }
    
    func setupButton() {
        generateBT.layer.cornerRadius = 5
        generateBT.backgroundColor = .systemIndigo
        generateBT.isEnabled = false
    }
    
    
    @IBAction func tapOnGenerate(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "secondVC")
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewMeal {
            return categoriesMealData?.categories?.count ?? 0
        }else {
            return self.viewModeDrink.categoriesDink.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoriesViewCell", for: indexPath) as! CategoriesViewCell
        
        if collectionView == self.collectionViewMeal {
            cell.categoriesName.text = categoriesMealData?.categories?[indexPath.row].strCategory
        }
        else {
            cell.categoriesName.text = self.viewModeDrink.categoriesDink[indexPath.row].nameDrink
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = (view.frame.width - 20) / 3
        return CGSize(width: w, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.contentView.backgroundColor = .blue
        cell?.contentView.layer.cornerRadius = 10
        
        if mealSelect == true {
            if drinkSelect == true {
                generateBT.isEnabled = true
                generateBT.backgroundColor = .blue
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.contentView.backgroundColor = nil
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if collectionView == self.collectionViewMeal {
            let key = categoriesMealData?.categories?[indexPath.row].strCategory! ?? ""
            viewModelMeal.generateMeal(key: key)
            mealSelect = true
           
        } else {
            let key = viewModeDrink.categoriesDink[indexPath.row].nameDrink
            viewModeDrink.generateDrink(key: key)
            drinkSelect = true
        }
        return true
    }
    
}
