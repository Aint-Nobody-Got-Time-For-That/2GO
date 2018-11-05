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
    
    @IBOutlet weak var gradientView: UIView!
    func categoriesString(_ categories: [String]) -> String {
        var catString = ""
        for category in categories{
            catString += " \(category)"
            
        }
        return catString
    }
    
//    func setGradient() {
//        let gradient: CAGradientLayer = CAGradientLayer()
//        gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
//        gradient.locations = [0.0 , 1.0]
//        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
//        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
//        gradient.frame = gradientView.layer.frame
//        gradientView.layer.insertSublayer(gradient, at: 0)
//    }
//
//
    
    
    override func awakeFromNib() {
        self.resPhoto.layer.cornerRadius = 5
        self.resPhoto.clipsToBounds = true
//            setGradient()
    }
    
    var restaurant: Restaurant! {
        didSet {
            self.resName.text = restaurant.name
            self.resPhoto.af_setImage(withURL: URL(string: restaurant.photos[0])!)
            self.catagoriesLabel.text = categoriesString(restaurant.categories)
           
        
        }
    }
    
    
    
}
