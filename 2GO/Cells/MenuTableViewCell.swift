//
//  MenuTableViewCell.swift
//  2GO
//
//  Created by Pat Khai on 10/19/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuCost: UILabel!
    @IBOutlet weak var menuTitle: UILabel!
    @IBOutlet weak var menuImage: UIImageView!
    
    var menuItem: MenuItem! {
        didSet {
            self.menuTitle.text = menuItem.description
            self.menuImage.layer.borderWidth = 4
            self.menuImage.layer.masksToBounds = false
            self.menuImage.layer.borderColor = UIColor.clear.cgColor
            self.menuImage.layer.cornerRadius = menuImage.frame.height/2
            self.menuImage.clipsToBounds = true
            self.menuImage.af_setImage(withURL: URL(string: menuItem.photo[0])!)
            self.menuCost.text = String("$\(menuItem.menuCost)")
        }
    }
   
    

}
