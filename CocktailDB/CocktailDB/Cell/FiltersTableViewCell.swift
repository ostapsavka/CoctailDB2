//
//  FiltersTableViewCell.swift
//  CocktailDB
//
//  Created by Sawka Ostap on 01.07.2020.
//  Copyright © 2020 SavkaOstap. All rights reserved.
//

import UIKit

class FiltersTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var checkmarkButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
