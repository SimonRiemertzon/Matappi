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
    var searchResult : [String] = []
    
    let data = ["Bli","Hej","Hopp","Fall","Erall","La", ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // definesPresentationContext
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        
        tableView.tableHeaderView = searchController.searchBar
        tableView.reloadData()
    }

    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text?.lowercased() {
            searchResult = data.filter({item in item.lowercased().contains(searchText)})
        } else {
            searchResult = []
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

    
    

    // MARK: - Table view data source
    
    //for row in latestSearchResult{
    //for more in row{
    //    print more.name
    //}
    //}

    override func numberOfSections(in tableView: UITableView) -> Int {
               return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if shouldUseSearchResult {
            return searchResult.count
            
        } else {
            return data.count
        }
       // return latestSearchResult.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        if shouldUseSearchResult {
            cell.textLabel?.text = searchResult[indexPath.row]
        } else {
           // let item = latestSearchResult[indexPath.row] as[String: Any]
           // if let name = item["name"] as? String {
           //     cell.textLabel?.text = name
            cell.textLabel?.text = data[indexPath.row]
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
