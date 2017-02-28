//
//  MatApiTableViewController.swift
//  Matapi
//
//  Created by Simon Riemertzon on 16/02/17.
//  Copyright © 2017 Simon Riemertzon. All rights reserved.
//

import UIKit

class MatApiTableViewController: UITableViewController, UISearchResultsUpdating {

    var searchController : UISearchController!
   
    
    var data : [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        definesPresentationContext = true
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        
        tableView.tableHeaderView = searchController.searchBar
        tableView.reloadData()
    }

    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text?.lowercased() {
            getData(searchText: searchText, onData: { (data) in
                self.data = data
            })
        } else {
            data = []
        }
        tableView.reloadData()
    }
    
    var shouldUseSearchResult : Bool {
        if let searchText = searchController.searchBar.text {
            if searchText.isEmpty {
                return false
            }
        }
        return searchController.isActive
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
               return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if shouldUseSearchResult {
            return self.data.count
            
        } else {
            return data.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ItemTableViewCell

        if shouldUseSearchResult {
            
            let name = self.data[indexPath.row]["name"] as! String
            cell.textLabel?.text = name
            cell.itemName = name
            
        } else {
           // let item = latestSearchResult[indexPath.row] as[String: Any]
           // if let name = item["name"] as? String {
           //     cell.textLabel?.text = name
            let name = self.data[indexPath.row]["name"] as! String
            cell.textLabel?.text = name
            cell.itemName = name
            }

        
        
        
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
 
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let cell = sender as? ItemTableViewCell {
            segue.destination.title = cell.itemName
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
  

}
