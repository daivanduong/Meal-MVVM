//
//  ViewController.swift
//  Meal-MVVM
//
//  Created by Ocean97 on 22/05/2023.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var collectionViewDrink: UICollectionView!
    
    var categoriesMealData: CategoriesMeal?
    var viewModelCategoriesMeal = CategriesMealViewModel()
    var viewModeDrink = DrinkViewModel()
    var viewModelMeal = MealViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupCollectionView()
        setupCollectionDrink()

    }
    
    func setupCollectionView() {
        viewModelCategoriesMeal.getDataAPICategoriesMeal { [weak self] in
            self?.categoriesMealData = self?.viewModelCategoriesMeal.categoriesMeal
            DispatchQueue.main.async {
                let nib = UINib(nibName: "CategoriesMealCVC", bundle: nil)
                self?.collectionView.register(nib, forCellWithReuseIdentifier: "categoriesMealCVC")
                
                self?.collectionView.delegate = self
                self?.collectionView.dataSource = self
                self?.collectionView.reloadData()
            }
            
        }
        
    }
    
    func setupCollectionDrink() {
        
        viewModeDrink.getDataDrink {}
        
        let nib = UINib(nibName: "CategoriesMealCVC", bundle: nil)
        collectionViewDrink.register(nib, forCellWithReuseIdentifier: "categoriesMealCVC")
        collectionViewDrink.delegate = self
        collectionViewDrink.dataSource = self
        collectionViewDrink.reloadData()
    
    }
    
    
    @IBAction func tapOnGenerate(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "secondVC")
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
   


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return categoriesMealData?.categories?.count ?? 0
        }else {
            return self.viewModeDrink.categoriesDink.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoriesMealCVC", for: indexPath) as! CategoriesMealCVC
        
        if collectionView == self.collectionView {
            cell.categoriesName.text = categoriesMealData?.categories?[indexPath.row].strCategory
        }
        else {
            cell.categoriesName.text = self.viewModeDrink.categoriesDink[indexPath.row].nameDrink
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.collectionView {
            let w = (view.frame.width - 20) / 3
            return CGSize(width: w, height: 80)
        } else {
            let w = (view.frame.width - 20) / 3
            return CGSize(width: w, height: 80)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath){
            cell.contentView.backgroundColor = .blue
            cell.contentView.layer.cornerRadius = 10
        }
        
        if collectionView == self.collectionView {
            let key = categoriesMealData?.categories?[indexPath.row].strCategory! ?? ""
            viewModelMeal.generateMeal(key: key)
            
           
        } else {
            let key = viewModeDrink.categoriesDink[indexPath.row].nameDrink
            viewModeDrink.generateDrink(key: key)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath){
            cell.contentView.backgroundColor = nil
        }
    }

}
