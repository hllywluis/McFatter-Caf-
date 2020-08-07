//
//  MenuTableViewCell.swift
//  Cafe
//
//  Created by Luis Bauza on 4/3/17.
//  Copyright © 2017 Luis Bauza. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    // Image View
    @IBOutlet weak var foodImageView: UIImageView!
    
    // Labels
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var calorieLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    // Text View
    @IBOutlet weak var foodDescription: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Configure cell.
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
