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
            self.menuImage.layer.borderWidth = 4
            self.menuImage.layer.masksToBounds = false
            self.menuImage.layer.borderColor = UIColor.clear.cgColor
            self.menuImage.layer.cornerRadius = menuImage.frame.height/2
            self.menuImage.clipsToBounds = true
            self.menuImage.contentMode = .scaleAspectFill
            self.menuImage.file = menuItem.photo
            self.menuImage.loadInBackground()
        }
        
    }

}
