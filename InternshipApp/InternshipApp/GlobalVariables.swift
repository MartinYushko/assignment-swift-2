//
//  GlobalVariables.swift
//  InternshipApp
//
//  Created by Martin Yushko on 2019-05-19.
//  Copyright © 2019 Martin Yushko. All rights reserved.
//

import Foundation
import UIKit

struct GlobalVariables {
    
    static var trending: [FoodData] = [
        FoodData(name: "Martin Yushko", foodName: "Borscht", image: UIImage(named: "borscht"), description: "Borscht is a Ukrainean soup. The red color is achieved by the addition of beets and to enchance the flavor, sour cream is often added and mixed in prior to consumption. This is among the most popular soviet/russian/ukrainean soups."),
        
        FoodData(name: "Fred Alfred", foodName: "Fettuccine Alfredo", image: UIImage(named: "fettuccineAlfredo"), description: "This food hits all the right spots. It is a comfort food found in almost all american restaurants, and remains a staple in the culture of fettuccine cuisine. Indeed, I did just make up the concept of fettuccine cuisine, but it is amazing all the same."),
        
        FoodData(name: "Papiaro pizzario", foodName: "Pizza", image: UIImage(named: "pizza"), description: "I mean... what is there to say about pizza? It's pizza! Who doesn't love it?"),
        
        FoodData(name: "Taki Toka", foodName: "Taco", image: UIImage(named: "taco"), description: "Trully a masterpiece by all standards. WHat a pleasure to eat, to crunch own on, to enjoy with a friend, to enjoy alone, to enjoy at home, and outside. It's really perfect for every occasion."),
        
        FoodData(name: "Fruliet saladulet", foodName: "Fruit Salad", image: UIImage(named: "fruitSalad"), description: "Simple but good. There is nothing quite a relaxing, calming, and serine as fruit salad. They have this way about them. Best of all, they are easy to make at home, and provide such a rich variety of tastes and textures."),
        
        FoodData(name: "Cromeo Ice", foodName: "Ice Cream", image: UIImage(named: "iceCream"), description: "A classic in the world of deserts. There is something special about the way it melts and settles on your tongue. Though beware, the brain freezes it can conjure are not for the faint of heart."),
        
        FoodData(name: "Bob Ross", foodName: "Hamburger", image: UIImage(named: "hamburger"), description: "Everyone knows this comfort food. It has led you through thick and thin, and you are stronger for it. There is nothing quite like biting down on its layers of food heaven."),
        
        FoodData(name: "Raymond Lieu", foodName: "Fish & Chips", image: UIImage(named: "fishAndChips"), description: "This british classic has withstood the test of time, and families all around the world are enjoying the delicious crunch of the friends, and the tender meat of the well-made fish."),
        
        FoodData(name: "Jilian Armstrong", foodName: "Greek Salad", image: UIImage(named: "greekSalad"), description: "Martin was too lazy to write something here."),
        
        FoodData(name: "Grace Bonacroix", foodName: "Chocolate Cake", image: UIImage(named: "chocolateCake"), description: "Martin was too lazy to write something here."),
        
        FoodData(name: "Peter Strange", foodName: "Spaghetti & Meatballs", image: UIImage(named: "spaghettiAndMeatballs"), description: "Martin was too lazy to write something here."),
        
        FoodData(name: "Parker Strale", foodName: "Pie", image: UIImage(named: "pie"), description: "Martin was too lazy to write something here."),
        
        FoodData(name: "Brad Pang", foodName: "Macaroon", image: UIImage(named: "macaroon"), description: "Martin was too lazy to write something here."),
        
        FoodData(name: "Bronwen Marchant", foodName: "Cheesecake", image: UIImage(named: "cheesecake"), description: "Martin was too lazy to write something here.")
        
                                           ]
    
    static var user = Profile(name: "Martin Yushko", biography: "I love food. Like I really really love food. A lot. It's almost a problem... almost. Actually on - it probably is a problem to be honest. But alas, that is the fate of a weak-minded soul. And to be frank, food is awesome, so why not enjoy it, right?", favoriteFoods: [
        
        FoodData(name: "Martin Yushko", foodName: "Borscht", image: UIImage(named: "borscht"), description: "Borscht is a Ukrainean soup. The red color is achieved by the addition of beets and to enchance the flavor, sour cream is often added and mixed in prior to consumption. This is among the most popular soviet/russian/ukrainean soups."),
        
        FoodData(name: "Fred Alfred", foodName: "Fettuccine Alfredo", image: UIImage(named: "fettuccineAlfredo"), description: "This food hits all the right spots. It is a comfort food found in almost all american restaurants, and remains a staple in the culture of fettuccine cuisine. Indeed, I did just make up the concept of fettuccine cuisine, but it is amazing all the same."),
        
        FoodData(name: "Papiaro pizzario", foodName: "Pizza", image: UIImage(named: "pizza"), description: "I mean... what is there to say about pizza? It's pizza! Who doesn't love it?"),
        
        FoodData(name: "Taki Toka", foodName: "Taco", image: UIImage(named: "taco"), description: "Trully a masterpiece by all standards. WHat a pleasure to eat, to crunch own on, to enjoy with a friend, to enjoy alone, to enjoy at home, and outside. It's really perfect for every occasion."),
        
        FoodData(name: "Fruliet saladulet", foodName: "Fruit Salad", image: UIImage(named: "fruitSalad"), description: "Simple but good. There is nothing quite a relaxing, calming, and serine as fruit salad. They have this way about them. Best of all, they are easy to make at home, and provide such a rich variety of tastes and textures.")
        ])
}
