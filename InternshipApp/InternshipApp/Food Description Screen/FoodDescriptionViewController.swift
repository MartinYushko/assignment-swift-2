//
//  FoodDescriptionViewController.swift
//  InternshipApp
//
//  Created by Martin Yushko on 2019-05-20.
//  Copyright © 2019 Martin Yushko. All rights reserved.
//

import UIKit

class FoodDescriptionViewController: UIViewController {

    @IBOutlet weak var foodImageView: UIImageView!
    
    @IBOutlet weak var allDoneLabel: UILabel!
    
    @IBOutlet weak var foodNameLabel: UILabel!
    
    @IBOutlet weak var chefNameLabel: UILabel!
    
    @IBOutlet weak var foodDescriptionLabel: UILabel!
    
    @IBOutlet weak var addToFavoritesButton: UIButton!
    
    @IBAction func clickedReturn(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            //
        })
    }
    
    @IBAction func clickedAddToFavorites(_ sender: Any) {

        UIView.animate(withDuration: 0.5, animations: {
            self.addToFavoritesButton.transform = CGAffineTransform(translationX: -60, y: 0)
            self.allDoneLabel.transform = CGAffineTransform(translationX: -60, y: 0)
            self.allDoneLabel.alpha = 1
            self.view.layoutIfNeeded()
        }, completion: { success in
            self.hasAddedToFavorites = success
            
            if success {
                GlobalVariables.user.favorites?.append(FoodData(name: self.chefName ?? "", foodName: self.foodName ?? "", image: self.foodImage, description: self.foodDescription ?? ""))
            }
        })
    }
    
    var hasAddedToFavorites: Bool = false {
        didSet {
            if hasAddedToFavorites {
                addToFavoritesButton.isEnabled = false
            }
        }
    }
    
    var viewingFromFavorites = false
    
    var foodDescription: String?
    var foodName: String?
    var foodImage: UIImage?
    var chefName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if viewingFromFavorites {
            addToFavoritesButton.alpha = 0
        }
        
        foodImageView.image = foodImage
        foodNameLabel.text = foodName
        foodDescriptionLabel.text = foodDescription
        chefNameLabel.text = chefName
    }
}
