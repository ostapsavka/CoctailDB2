//
//  CoctailTableViewCell.swift
//  CocktailDB
//
//  Created by Sawka Ostap on 30.06.2020.
//  Copyright © 2020 SavkaOstap. All rights reserved.
//

import UIKit

class CoctailTableViewCell: UITableViewCell {

    @IBOutlet weak var coctailImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
