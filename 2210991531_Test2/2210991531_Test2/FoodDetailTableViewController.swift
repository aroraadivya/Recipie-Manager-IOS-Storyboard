//
//  FoodDetailTableViewController.swift
//  2210991531_Test2
//
//  Created by Divya Arora on 23/11/24.
//

import UIKit

class FoodDetailTableViewController: UITableViewController {
    
    // Food item passed from the previous view controller
    var foodDetail: FoodDetails?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Food Details"
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4  // We have 4 sections: Recipe Name, Ingredients, Preparation Time, and Calorie Count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1 // Recipe Name
        case 1: return foodDetail?.ingredients.count ?? 0 // Ingredients
        case 2: return 1 // Preparation Time
        case 3: return 1 // Calorie Count
        default: return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)

        switch indexPath.section {
        case 0:
            // Recipe Name
            cell.textLabel?.text = foodDetail?.recipeName
        case 1:
            // Ingredients
            if let ingredient = foodDetail?.ingredients[indexPath.row] {
                cell.textLabel?.text = ingredient
            }
        case 2:
            // Preparation Time
            cell.textLabel?.text = "Preparation Time: \(foodDetail?.preperationTime ?? 0) minutes"
        case 3:
            // Calorie Count
            cell.textLabel?.text = "Calories: \(foodDetail?.calorieCount ?? 0) kcal"
        default:
            break
        }
        
        return cell
    }
}
