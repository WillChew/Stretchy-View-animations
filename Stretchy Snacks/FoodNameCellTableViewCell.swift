//
//  FoodNameCellTableViewCell.swift
//  Stretchy Snacks
//
//  Created by Will Chew on 2018-07-19.
//  Copyright © 2018 Will Chew. All rights reserved.
//

import UIKit

class FoodNameCellTableViewCell: UITableViewCell {
    @IBOutlet weak var foodNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
