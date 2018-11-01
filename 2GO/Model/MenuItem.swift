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
}
