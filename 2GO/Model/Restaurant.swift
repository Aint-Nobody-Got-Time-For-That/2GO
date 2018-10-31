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
    
//    let id: Int
//    let name: String
//    let photos: [String]
//    let categories: [String]
//    let address: String
//    let latitude: Double
//    let longitude: Double
//    let phoneNumber: String
//    let menuItems: [MenuItem]
//
//    init(id: Int, name: String, photos: [String], categories: [String], address: String, latitude: Double, longitude: Double, phoneNumber: String, menuItems: [MenuItem]) {
//        self.id = id
//        self.name = name
//        self.photos = photos
//        self.categories = categories
//        self.address = address
//        self.latitude = latitude
//        self.longitude = longitude
//        self.phoneNumber = phoneNumber
//        self.menuItems = menuItems
//
//    }
}
