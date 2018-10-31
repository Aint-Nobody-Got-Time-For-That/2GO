//
//  MenuItem.swift
//  2GO
//
//  Created by Victor Li on 10/11/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import Foundation
import Parse

class MenuItem: PFObject, PFSubclassing {
    
    @NSManaged var photo: PFFile
    @NSManaged var menuItemDescription: String
    @NSManaged var price: String
    @NSManaged var name: String
    
    static func parseClassName() -> String {
        return "MenuItem"
    }
    
//    let id: Int
//    let photo: [String]
//    let description: String
//    let menuDescription: String
//    let menuCost: Double
//
//
//    // TODO: might not need these properties right now.
////    let rating: Double
////    let reviews: [String]
////    let allegeries: String
//
//    init(id: Int, photo: [String], description: String, menuDescription: String, menuCost: Double) {
//        self.id = id
//        self.photo = photo
//        self.description = description
//        self.menuDescription = menuDescription
//        self.menuCost = menuCost
//    }
}
