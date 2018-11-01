//
//  Restaurant.swift
//  2GO
//
//  Created by Victor Li on 10/11/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import Foundation
import Parse

class Restaurant: PFObject, PFSubclassing {
    @NSManaged var photo: PFFile
    @NSManaged var name: String
    @NSManaged var phoneNumber: String
    @NSManaged var street: String
    @NSManaged var city: String
    @NSManaged var state: String
    @NSManaged var zipCode: String
    
    static func parseClassName() -> String {
        return "Restaurant"
    }
}
