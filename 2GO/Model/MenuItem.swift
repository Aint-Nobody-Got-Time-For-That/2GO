//
//  MenuItem.swift
//  2GO
//
//  Created by Victor Li on 10/11/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import Foundation

struct MenuItem {
    let id: Int
    let photo: [String]
    let description: String

    // TODO: might not need these properties right now.
//    let rating: Double
//    let reviews: [String]
//    let allegeries: String
    
    init(id: Int, photo: [String], description: String) {
        self.id = id
        self.photo = photo
        self.description = description
    }
}
