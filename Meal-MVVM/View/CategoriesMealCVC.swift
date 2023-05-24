//
//  CategoriesMealCVC.swift
//  Meal-MVVM
//
//  Created by Ocean97 on 22/05/2023.
//

import UIKit

class CategoriesMealCVC: UICollectionViewCell {

    @IBOutlet weak var categoriesName: UILabel!
    @IBOutlet weak var viewCell: UIView!
    
    @IBOutlet weak var viewLB: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewCell.layer.cornerRadius = 10
        viewCell.layer.borderWidth =  2
        viewCell.layer.borderColor = UIColor.black.cgColor
        
        viewLB.layer.cornerRadius = 10
    }

}
