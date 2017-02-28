//
//  ItemTableViewCell.swift
//  Matapi
//
//  Created by Simon Riemertzon on 27/02/17.
//  Copyright © 2017 Simon Riemertzon. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    var itemName : String = ""
    var itemNumber : Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
