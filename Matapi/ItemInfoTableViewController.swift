//
//  ItemInfoTableViewController.swift
//  Matapi
//
//  Created by Simon Riemertzon on 01/03/17.
//  Copyright © 2017 Simon Riemertzon. All rights reserved.
//

import UIKit

class ItemInfoTableViewController: UITableViewController {
    
    @IBOutlet weak var nutritionalValueLabel: UILabel!
    
    var itemName : String = ""
    var itemNumber : Int = 0
    
    var data : [String: Double] = [:]
    var kcal : Double = 0.0
    var carbs : Double = 0.0
    var sugar : Double = 0.0
    var protein : Double = 0.0
    
    func setNutritionValue (_ kcalValue: Double, _ carbs: Double, _ sugar: Double, _ protein: Double){
        var nutVal = 5
        
        if sugar > 20 {
            nutVal - 1
        }
        
        if carbs 
        
        
        
        nutritionalValueLabel.text? = "Nyttighetsvärde : " + String(nutVal)
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()

        
        getFoodItemData(searchNumber: String(itemNumber), onData: {
            (data) in
            self.data = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
        
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! ItemInfoTableViewCell
    
        
        
        
        if indexPath.row == 0 {
            cell.infoLabel.text = "Protein"
            if let protein = data ["protein"] {
                cell.valueLabel.text = "\(protein)"
                self.protein = protein
            } else {
                cell.valueLabel.text = "..."
            }
            
        }
        else if indexPath.row == 1 {
            cell.infoLabel.text = "kcal"
            if let energyKcal = data["energyKcal"] {
                cell.valueLabel.text = "\(energyKcal)"
                kcal = energyKcal
            } else {
                cell.valueLabel.text = "..."
            }
        }
        else if indexPath.row == 2{
            cell.infoLabel.text = "Kolhydrater"
            if let carbohydrates = data["carbohydrates"] {
                carbs = carbohydrates
                cell.valueLabel.text = "\(carbohydrates)"
            } else {
                cell.valueLabel.text = "..."
            }
        }
        else if indexPath.row == 3{
            cell.infoLabel.text = "Socker"
            if let saccharose = data["saccharose"] {
                sugar = saccharose
                cell.valueLabel.text = "\(saccharose)"
            } else {
                cell.valueLabel.text = "..."
            }
        }
        
        
    
        setNutritionValue(kcal, carbs, sugar, protein )
        
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
