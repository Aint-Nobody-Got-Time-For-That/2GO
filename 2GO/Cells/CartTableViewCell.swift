//
//  CartTableViewCell.swift
//  2GO
//
//  Created by Pat Khai on 10/25/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import UIKit
import ParseUI

class CartTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var menuName: UILabel!
    @IBOutlet weak var menuCost: UILabel!
    @IBOutlet weak var menuImage: PFImageView!
    
    var menuItem: MenuItem! {
        didSet {
            self.menuName.text = menuItem.name
            self.menuCost.text = String("$\(menuItem.price)")
            self.menuImage.file = menuItem.photo
            self.menuImage.loadInBackground()
        }
        
    }

}
