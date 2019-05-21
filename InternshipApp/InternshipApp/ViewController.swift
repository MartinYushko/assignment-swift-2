//
//  ViewController.swift
//  InternshipApp
//
//  Created by Martin Yushko on 2019-05-19.
//  Copyright © 2019 Martin Yushko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var foodCollectionView: UICollectionView!
    @IBOutlet weak var foodTableView: UITableView!
    
    @IBOutlet weak var profileButton: UIButton!
    
    private var segueData: FoodData?
    private var showInTrending: Int = 8
    private var transition = CircularTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func transform(cell: UICollectionViewCell, firstTime: Bool) {
        //this function serves to animate the cells as they are scrolled to create a wheel effect
        
        let convertedFrame = cell.convert(cell.bounds, to: self.view)
        
        //the offset exists to tell this method that cells which are at the very edge of the screen on either side should not be animated. Therefore, the relative scales and distances all consider the bounds of the collection view to be inseted 36 units on both sides
        let offset: CGFloat = 36
        
        //the "edge" is defined as being beyond the offset on either side
        let isAtEdge = convertedFrame.minX <= offset || convertedFrame.maxX >= foodCollectionView.bounds.width - offset
        
        //do not change scale of cells that are close to the edge of the screen unless it is the first time the cell appears on screen, since otherwise, it will be at full scale, which is not consistent with the goal of this effect where the outer cells are meant to be smaller
        if !firstTime && isAtEdge {
            return
        }

        if firstTime && isAtEdge {
            //if this is true, then an edge case occurs where it is simply easier to assign a value to the scale.
            cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            return
        }
        
        //instead of using minX, midX, or maxX when calculating distances, which isn't reliable and looks scewed to one side when animating, relativeX calculates a relative x-coordinate of the cell based on where it is on the screen. If it is in the middle of the screen, for example, relativeX = midX, if it is 36 (the offset) from the left, relativeX = minX, and if it is 36 from the right, relativeX = maxX, etc.
        
        //relativeX is calculated by using its minX as a reference point, then adding a certain percentage of its width to generate the appropriate x value. The percent is equal to its relative position in the collection view, taking into account the offsets on both sides. When the percentage = 1, relativeX = maxX, since maxX = minX + bounds.width, and when percentage = 0, relativeX = minX, etc.
        
        let relativeX = convertedFrame.minX + cell.bounds.width*(convertedFrame.minX - offset)/(foodCollectionView.bounds.width - 2*offset)
        
        //use the relativeX value to calculate the cells relative distance from the middle of the screen
        var fromMiddle = foodCollectionView.bounds.width/2 - relativeX
        
        //fromMiddle will be negative if the cell is past the half-way point, so this will ensure that the absolute value is used
        if fromMiddle < 0 {fromMiddle = fromMiddle * -1}
        
        //account for the offset
        let fromMiddleWithOffset = fromMiddle - offset
        
        //calculate its relativistic distance from the half way point to generate its apparent rotation on a wheel
        var percent = fromMiddleWithOffset/(foodCollectionView.bounds.width - 2*offset)
        
        //this will create more consistency with the scales, ensuring that the cells will not look too small or too big from one another.
        let percentOffset: CGFloat = 0.2
        percent = percent - percentOffset
        
        //if something went wrong and the percentages are less or above of their expected values, force them to conform and avoid errors when transforming the cell
        if percent < 0 { percent = 0 }
        else if percent > 1 { percent = 1 }
        
        cell.transform = CGAffineTransform(scaleX: 1 - percent, y: 1 - percent)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFoodDescription" {
            if let destinationVC  = segue.destination as? FoodDescriptionViewController {
                if let data = segueData {
                    destinationVC.foodImage = data.foodImage
                    destinationVC.foodDescription = data.foodDescription
                    destinationVC.foodName = data.foodName
                    destinationVC.chefName = data.chefName
                }
            }
        }
            
        else if segue.identifier == "showProfile" {
            if let destinationVC = segue.destination as? ProfileViewController {
                destinationVC.transitioningDelegate = self
                destinationVC.modalPresentationStyle = .custom
            }
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? TableViewFoodCell {
            segueData = cell.data
            performSegue(withIdentifier: "showFoodDescription", sender: self)
        }
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if GlobalVariables.trending.count > showInTrending {
            return GlobalVariables.trending.count - showInTrending
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell") as? TableViewFoodCell {
            
            cell.data = GlobalVariables.trending[showInTrending + indexPath.row]
            
            return cell
        }
        
        return UITableViewCell()
    }
}

extension ViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        foodCollectionView.visibleCells.forEach { (myCell) in
            transform(cell: myCell, firstTime: false)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewFoodCell {
            segueData = cell.data
            performSegue(withIdentifier: "showFoodDescription", sender: self)
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if GlobalVariables.trending.count > showInTrending {
            return showInTrending
        }
        
        return GlobalVariables.trending.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as? CollectionViewFoodCell {
            
            cell.data = GlobalVariables.trending[indexPath.row]
            
            transform(cell: cell, firstTime: true)
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = profileButton.center
        transition.circleColor = .white
        transition.duration = 1
        return transition
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = profileButton.center
        transition.circleColor = .white
        transition.duration = 1
        return transition
    }
}
