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
        
        var menuPick: Cart! {
            didSet {
                self.menuName.text = menuPick.name
                self.menuCost.text = String("$\(menuPick.menuCost)")
                self.menuImage.af_setImage(withURL: URL(string: menuPick.photo[0])!)
            }
        
    }
    

}
