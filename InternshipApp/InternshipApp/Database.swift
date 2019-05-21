//
//  DataSource.swift
//  InternshipApp
//
//  Created by Martin Yushko on 2019-05-19.
//  Copyright © 2019 Martin Yushko. All rights reserved.
//

import Foundation
import UIKit

struct FoodData {
    var chefName: String
    var foodImage: UIImage?
    var foodName: String
    var foodDescription: String
    
    init(name: String, foodName: String, image: UIImage?, description: String) {
        self.chefName = name
        self.foodName = foodName
        self.foodImage = image
        self.foodDescription = description
    }
    
}

struct Profile {
    var name: String?
    var biography: String?
    var favorites: [FoodData]?
    
    init(name: String, biography: String, favoriteFoods: [FoodData]) {
        self.name = name
        self.biography = biography
        self.favorites = favoriteFoods
    }
}
