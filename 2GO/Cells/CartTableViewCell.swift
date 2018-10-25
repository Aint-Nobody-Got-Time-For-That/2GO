//
//  CartTableViewCell.swift
//  2GO
//
//  Created by Pat Khai on 10/25/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    @IBOutlet weak var menuName: UILabel!
    
    @IBOutlet weak var menuCost: UILabel!
    @IBOutlet weak var menuImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
