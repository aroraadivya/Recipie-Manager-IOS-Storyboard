//
//  RecipieTableTableViewController.swift
//  2210991531_Test2
//
//  Created by Divya Arora on 23/11/24.
//

import UIKit

class RecipeTableViewController: UITableViewController {

    let breakfast = TimeFood(foodTime: "Breakfast", food: [
        Food(foodName: "chole bhature", foodDetails: [
            FoodDetails(
                recipeName: "Chole Bhature",
                ingredients: ["Flour", "Milk", "Baking Powder", "Butter"],
                category: .vegetarian,
                preperationTime: 15,
                calorieCount: 250.0
//                foodImage: UIImage(named: "Image1")
            ),
            FoodDetails(
                recipeName: "Vegan Pancakes",
                ingredients: ["Flour", "Almond Milk", "Baking Powder"],
                category: .vegan,
                preperationTime: 20,
                calorieCount: 180.0
            )
        ]),
        
        Food(foodName: "Aloo Puri", foodDetails: [
            FoodDetails(
                recipeName: "Aloo Puri",
                ingredients: ["Flour", "Oil", "Aloo", "Butter"],
                category: .vegetarian,
                preperationTime: 15,
                calorieCount: 250.0
            ),
            FoodDetails(
                recipeName: "Vegan Pancakes",
                ingredients: ["Flour", "Almond Milk", "Baking Powder"],
                category: .vegan,
                preperationTime: 20,
                calorieCount: 180.0
            )
        ]),
        
        Food(foodName: "Oatmeal", foodDetails: [
            FoodDetails(
                recipeName: "Simple Oatmeal",
                ingredients: ["Oats", "Water", "Salt", "Brown Sugar"],
                category: .vegan,
                preperationTime: 10,
                calorieCount: 150.0
            )
        ])
    ])
    
    let lunch = TimeFood(foodTime: "Lunch", food: [
        Food(foodName: "Grilled Chicken Salad", foodDetails: [
            FoodDetails(
                recipeName: "Grilled Chicken Salad",
                ingredients: ["Chicken Breast", "Lettuce", "Tomatoes", "Olive Oil", "Lemon", "Garlic"],
                category: .non_vegetarian,
                preperationTime: 25,
                calorieCount: 350.0
            )
        ]),
        Food(foodName: "Veggie Wrap", foodDetails: [
            FoodDetails(
                recipeName: "Veggie Wrap",
                ingredients: ["Tortilla", "Lettuce", "Tomato", "Cucumber", "Hummus"],
                category: .vegan,
                preperationTime: 15,
                calorieCount: 250.0
            )
        ]),
        
        Food(foodName: "Grilled Chicken Salad", foodDetails: [
            FoodDetails(
                recipeName: "Grilled Chicken Salad",
                ingredients: ["Chicken Breast", "Lettuce", "Tomatoes", "Olive Oil", "Lemon", "Garlic"],
                category: .non_vegetarian,
                preperationTime: 25,
                calorieCount: 350.0
            )
        ]),
        Food(foodName: "Veggie Wrap", foodDetails: [
            FoodDetails(
                recipeName: "Veggie Wrap",
                ingredients: ["Tortilla", "Lettuce", "Tomato", "Cucumber", "Hummus"],
                category: .vegan,
                preperationTime: 15,
                calorieCount: 250.0
            )
        ])
    ])
    
    let snacks = TimeFood(foodTime: "Snacks", food: [
        Food(foodName: "Corn chatt", foodDetails: [
            FoodDetails(
                recipeName: "Corn Chatt",
                ingredients: ["Corn", "Onion", "Tomatoes", "Olive Oil", "Lemon", "Garlic"],
                category: .non_vegetarian,
                preperationTime: 25,
                calorieCount: 350.0
            )
        ]),
        Food(foodName: "Wrap", foodDetails: [
            FoodDetails(
                recipeName: "Wrap",
                ingredients: ["Tortilla", "Lettuce", "Tomato", "Cucumber", "Hummus"],
                category: .vegan,
                preperationTime: 15,
                calorieCount: 250.0
            )
        ]),
        
        Food(foodName: "Corn chatt", foodDetails: [
            FoodDetails(
                recipeName: "Corn Chatt",
                ingredients: ["Corn", "Onion", "Tomatoes", "Olive Oil", "Lemon", "Garlic"],
                category: .non_vegetarian,
                preperationTime: 25,
                calorieCount: 350.0
            )
        ]),
        Food(foodName: "Wrap", foodDetails: [
            FoodDetails(
                recipeName: "Wrap",
                ingredients: ["Tortilla", "Lettuce", "Tomato", "Cucumber", "Hummus"],
                category: .vegan,
                preperationTime: 15,
                calorieCount: 250.0
            )
        ]),
    ])
    
    let dinner = TimeFood(foodTime: "Dinner", food: [
        Food(foodName: "Pasta", foodDetails: [
            FoodDetails(
                recipeName: "Pasta",
                ingredients: ["Pasta", "Tomatoes", "Garlic", "Olive Oil", "Basil", "Parmesan"],
                category: .vegetarian,
                preperationTime: 30,
                calorieCount: 400.0
            )
        ]),
        Food(foodName: "Grilled toast", foodDetails: [
            FoodDetails(
                recipeName: "Grilled Toast",
                ingredients: ["Bread", "Corn", "Lemon", "Olive Oil", "Garlic"],
                category: .non_vegetarian,
                preperationTime: 25,
                calorieCount: 500.0
            )
        ]),
        Food(foodName: "Pasta", foodDetails: [
            FoodDetails(
                recipeName: "Pasta",
                ingredients: ["Pasta", "Tomatoes", "Garlic", "Olive Oil", "Basil", "Parmesan"],
                category: .vegetarian,
                preperationTime: 30,
                calorieCount: 400.0
            )
        ]),
    ])
    
    var timeFoodData: [TimeFood] {
        return [breakfast, lunch, snacks, dinner]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return timeFoodData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeFoodData[section].food.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return timeFoodData[section].foodTime
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath)

        let timeFood = timeFoodData[indexPath.section]
        let food = timeFood.food[indexPath.row]
        
        if let foodDetail = food.foodDetails.first {
            cell.textLabel?.text = foodDetail.recipeName

            let ingredients = foodDetail.ingredients.joined(separator: ", ")
            let preparationTime = foodDetail.preperationTime
            let calorieCount = foodDetail.calorieCount
            cell.detailTextLabel?.text = "Ingredients: \(ingredients) | Prep: \(preparationTime) mins | Calories: \(calorieCount)"
            
        } else {
            cell.textLabel?.text = "No details available"
            cell.detailTextLabel?.text = ""
        }

        return cell
    }

    // MARK: - Table view delegate (optional)

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedFood = timeFoodData[indexPath.section].food[indexPath.row]
        
        performSegue(withIdentifier: "ShowFoodDetail", sender: selectedFood)
    }

    // MARK: - Prepare for Segue

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFoodDetail" {
            if let detailVC = segue.destination as? FoodDetailTableViewController,
               let selectedFood = sender as? Food {
                
                if let foodDetail = selectedFood.foodDetails.first {
                    detailVC.foodDetail = foodDetail
                }
            }
        }
    }
}
