//
//  ItemInfoViewController.swift
//  Matapi
//
//  Created by Simon Riemertzon on 01/03/17.
//  Copyright © 2017 Simon Riemertzon. All rights reserved.
//

import UIKit

class ItemInfoViewController: UIViewController {
    
    var itemName : String = ""
    var itemNumber : Int = 0
    var data : [String: Any] = [:]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        getFoodItemData(searchNumber: itemNumber.description, onData: { (data) in self.data = data})
            
       
        // Do any additional setup after loading the view.
    }
    
    

 
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
