//
//  PosterCollectionViewCell.swift
//  2GO
//
//  Created by Pat Khai on 10/19/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import UIKit
import AlamofireImage

class PosterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var resPhoto: UIImageView!
    
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
    
    var restaurant: Restaurant! {
        didSet {
            self.resName.text = restaurant.name
            self.resPhoto.af_setImage(withURL: URL(string: restaurant.photos[0])!)
            self.catagoriesLabel.text = categoriesString(restaurant.categories)
        
        }
    }
    
    
    
}
