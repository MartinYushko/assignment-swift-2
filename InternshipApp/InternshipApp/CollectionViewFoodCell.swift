//
//  CollectionViewFoodCell.swift
//  InternshipApp
//
//  Created by Martin Yushko on 2019-05-19.
//  Copyright © 2019 Martin Yushko. All rights reserved.
//

import UIKit

class CollectionViewFoodCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    public var data: FoodData? {
        didSet {
            if let myData = data {
                imageView.image = myData.foodImage
            }
        }
    }
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
    }
}
