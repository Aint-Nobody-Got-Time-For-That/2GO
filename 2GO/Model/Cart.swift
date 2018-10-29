//
//  Cart.swift
//  2GO
//
//  Created by Pat Khai on 10/25/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import Foundation
struct Cart {
    let photo: [String]
    let name: String
    let menuCost: Double
    
    init(photo: [String], name: String, menuCost: Double) {
        self.photo = photo
        self.name = name
        self.menuCost = menuCost
    }
    
}
