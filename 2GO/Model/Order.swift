//
//  Order.swift
//  2GO
//
//  Created by Victor Li on 11/9/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import Foundation
import Parse

class Order: PFObject, PFSubclassing {
    @NSManaged var phoneNumber: String
    @NSManaged var restaurantID: String
    @NSManaged var time: Date
    @NSManaged var total: Double
    @NSManaged var buyerName: String
    
    static func parseClassName() -> String {
        return "Order"
    }
}
