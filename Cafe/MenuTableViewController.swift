//
//  MenuTableViewController.swift
//  Cafe
//
//  Created by Luis Bauza on 4/3/17.
//  Copyright © 2017 Luis Bauza. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
//------------------------------------------------------------------------------------------------------------//
    // Example Code - to be deleted
    let example = "Patty Melt"
    let descript = "Two pieces of toasted bread, a beef patty, some American cheese, and caramelized onions."
    let calories = 450
    let image = #imageLiteral(resourceName: "example food")
    let price = 4.99
    // Example code ends here.
//------------------------------------------------------------------------------------------------------------//
    
    var foods = [Food](repeating: Food(), count: 50)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        tableView.allowsSelection = false
        getData()
    }
    
    // Retrieves data from JSON.
    func getData() {
        
        // URL where the PHP file is located.
        let requestURL: NSURL = NSURL(string: "http://localhost:63342/McFatter%20Cafe%20-%20PHP/PGSQL.php?_ijt=r0vfab90tig5em6dqllctbbnmi")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: requestURL as URL)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest as URLRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:AnyObject]
                    let foods = json["foods"] as! [[String:AnyObject]]
                    for food in foods {

                        // Set values to the ones in the JSON file.
                        var count = 0
                        let name = food["name"] as? String
                        let desc = food["description"] as? String
                        let price = food["price"] as! String
                        let calories = food["calories"] as! String

                        // Create a new food object with the extracted JSON.
                        let createdFood = Food(name: name!, desc: desc!, price: price, calories: calories)

                        // Set the Food object in the array to the newly created one.
                        self.foods[count] = createdFood
                        
                        print(name!)
                        print(desc!)
                        print(String(describing: price))
                        print(String(describing: calories))
                        
                        count += 1

                        // Reload the table data when a new item is added.
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error)
                }
            } else {
                print("Error.")
            }
        }
        task.resume()
    }
    
    func checkIfLoggedIn() {
        // To be implemented when there is a login system.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Entrées"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuTableViewCell

        let food = foods[indexPath.row] as Food
        
        // Sets text to current food title in the array. (When there is one.)
        cell.foodName.text = food.name
        // Sets description to description in the array.
        cell.foodDescription.text = food.desc
        // Sets calories.
        cell.calorieLabel.text = food.calories! + " calories"
        // Sets price.
        cell.priceLabel.text = "$" + food.price!
    
        // Scale image to be centered and cropped in the UIImageView.
        cell.foodImageView.contentMode = .scaleAspectFill
        cell.foodImageView.clipsToBounds = true
        cell.foodImageView.image = image
        
        // Returns created cell.
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
