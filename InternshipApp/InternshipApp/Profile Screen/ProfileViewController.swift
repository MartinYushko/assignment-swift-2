//
//  ProfileViewController.swift
//  InternshipApp
//
//  Created by Martin Yushko on 2019-05-20.
//  Copyright © 2019 Martin Yushko. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var biographyLabel: UILabel!
    
    @IBOutlet weak var favoritesCollectionView: UICollectionView!
    
    var segueData: FoodData?
    var data: Profile? = GlobalVariables.user
    
    @IBAction func dismissProfile(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateData()
    }
    
    func populateData() {
        if let userData = data {
            userNameLabel.text = userData.name
            biographyLabel.text = userData.biography
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFoodDescription" {
            if let destinationVC = segue.destination as? FoodDescriptionViewController {
                if let myData = segueData {
                    destinationVC.chefName = myData.chefName
                    destinationVC.foodImage = myData.foodImage
                    destinationVC.foodDescription = myData.foodDescription
                    destinationVC.foodName = myData.foodName
                    
                    destinationVC.viewingFromFavorites = true
                }
            }
        }
    }
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let myData = data?.favorites {
            return myData.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoriteFoodCell", for: indexPath) as? FavoritesCollectionViewCell {
        
            if let myData = data {
                cell.data = myData.favorites?[indexPath.row]
            }
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}

extension ProfileViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? FavoritesCollectionViewCell {
            
            if let myData = cell.data {
                segueData = myData
                
                performSegue(withIdentifier: "showFoodDescription", sender: self)
            }
        }
    }
}
