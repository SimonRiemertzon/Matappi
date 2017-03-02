//
//  ItemInfoTableViewCell.swift
//  Matapi
//
//  Created by Simon Riemertzon on 01/03/17.
//  Copyright © 2017 Simon Riemertzon. All rights reserved.
//

import UIKit

class ItemInfoTableViewCell: UITableViewCell {
    
 
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
