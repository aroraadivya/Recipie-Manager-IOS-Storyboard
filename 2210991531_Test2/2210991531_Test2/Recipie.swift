//
//  Recipie.swift
//  2210991531_Test2
//
//  Created by Divya Arora on 23/11/24.
//

import Foundation
import UIKit
struct TimeFood{
    
    let foodTime:String
    let food:[Food]
        
    }
    struct Food{
        let foodName:String
        let foodDetails:[FoodDetails]
        
        
    }
struct FoodDetails {
    let recipeName: String
    let ingredients: [String]
    let category: foodType
    let preperationTime: Int
    let calorieCount: Float
    var foodImage: UIImage?
}

enum foodType {
    case glutan, vegan, vegetarian, non_vegetarian, dairy
}
