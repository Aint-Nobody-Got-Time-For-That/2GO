//
//  OrderItems.swift
//  2GO
//
//  Created by Victor Li on 11/9/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import Foundation
import Parse

class OrderItem: PFObject, PFSubclassing {
    @NSManaged var quantity: Int
    
    static func parseClassName() -> String {
        return "OrderItem"
    }
}
