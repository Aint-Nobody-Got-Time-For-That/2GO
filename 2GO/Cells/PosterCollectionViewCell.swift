//
//  PosterCollectionViewCell.swift
//  2GO
//
//  Created by Pat Khai on 10/19/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import UIKit
import ParseUI

class PosterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var resPhoto: PFImageView!
    
    @IBOutlet weak var resName: UILabel!
    
    @IBOutlet weak var costLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var catagoriesLabel: UILabel!
    
    
    func categoriesString(_ categories: [String]) -> String {
        var catString = ""
        for category in categories{
            catString += " \(category)"
            
        }
        return catString
    }
    
    override func awakeFromNib() {
        self.resPhoto.layer.cornerRadius = 5
        self.resPhoto.clipsToBounds = true
    }
    
    var restaurant: Restaurant! {
        didSet {
            self.resName.text = restaurant.name
//            self.resPhoto.af_setImage(withURL: URL(string: restaurant.photos[0])!)
//            self.catagoriesLabel.text = categoriesString(restaurant.categories)
            resPhoto.file = restaurant.photo
            resPhoto.loadInBackground()
        
        }
    }
    
    
    
}
