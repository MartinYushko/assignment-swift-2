//
//  TableViewFoodCell.swift
//  InternshipApp
//
//  Created by Martin Yushko on 2019-05-19.
//  Copyright © 2019 Martin Yushko. All rights reserved.
//

import UIKit

class TableViewFoodCell: UITableViewCell {

    @IBOutlet weak var foodImageView: UIImageView!
    
    @IBOutlet weak var foodNameLabel: UILabel!
    
    @IBOutlet weak var chefNameLabel: UILabel!
    
    public var data: FoodData? {
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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
