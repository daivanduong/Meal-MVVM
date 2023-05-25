//
//  CategoriesViewCell.swift
//  Meal-MVVM
//
//  Created by Ocean97 on 25/05/2023.
//

import UIKit

class CategoriesViewCell: UICollectionViewCell {

    @IBOutlet weak var viewCell: UIView!
    
    @IBOutlet weak var viewLB: UIView!
    
    @IBOutlet weak var categoriesName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewCell.layer.cornerRadius = 10
        viewCell.layer.borderWidth =  2
        viewCell.layer.borderColor = UIColor.black.cgColor
        
        viewLB.layer.cornerRadius = 10
    }

}
