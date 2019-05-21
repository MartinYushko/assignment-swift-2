//
//  FavoritesCollectionViewCell.swift
//  InternshipApp
//
//  Created by Martin Yushko on 2019-05-20.
//  Copyright © 2019 Martin Yushko. All rights reserved.
//

import UIKit

class FavoritesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var foodImageView: UIImageView!
    
    @IBOutlet weak var foodNameLabel: UILabel!
    
    @IBOutlet weak var chefNameLabel: UILabel!
    
    var data: FoodData? {
        didSet {
            if let myData = data {
                foodImageView.image = myData.foodImage
                foodNameLabel.text = myData.foodName
                chefNameLabel.text = myData.chefName
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        foodImageView.layer.cornerRadius = 8
        foodImageView.clipsToBounds = true
    }
}
