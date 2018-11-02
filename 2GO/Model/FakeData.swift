//
//  FakeData.swift
//  2GO
//
//  Created by Victor Li on 10/11/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import Foundation

struct FakeData {
    static let restaurants: [Restaurant] = [
        Restaurant(id: 1, name: "Tropisueño", photos: ["https://s3-media2.fl.yelpcdn.com/bphoto/hUZgDmue1VRfvIXai6I0wg/o.jpg"], categories: ["Mexican", "Cocktail Bars"], address: "75 Yerba Buena Ln, San Francisco, CA", latitude: 37.7853008468227, longitude: -122.403918653727, phoneNumber: "(415) 243-0299", menuItems: [
            MenuItem(id: 0, photo: ["https://www.skinnytaste.com/wp-content/uploads/2013/04/easiest-crock-pot-salsa-verde-chicken-550x367.jpg"], description: "Slow-Cooked Salsa Verde Chicken Taco", menuDescription: "This is the perfect salsa verde Chicken Taco you will ever have.", menuCost: 12.99),
                MenuItem(id: 1, photo: ["https://images.unsplash.com/photo-1529006557810-274b9b2fc783?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=ae10582705f9402e297585fdb33b6348&auto=format&fit=crop&w=800&q=60"], description: "Beef Shawarma", menuDescription: "This is the perfect Beef Shawarma you will ever have.", menuCost: 11.99),MenuItem(id: 1, photo: ["https://images.unsplash.com/photo-1529006557810-274b9b2fc783?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=ae10582705f9402e297585fdb33b6348&auto=format&fit=crop&w=800&q=60"], description: "Beef Shawarma", menuDescription: "This is the perfect Beef Shawarma you will ever have.", menuCost: 11.99),MenuItem(id: 1, photo: ["https://images.unsplash.com/photo-1529006557810-274b9b2fc783?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=ae10582705f9402e297585fdb33b6348&auto=format&fit=crop&w=800&q=60"], description: "Beef Shawarma", menuDescription: "This is the perfect Beef Shawarma you will ever have.", menuCost: 11.99),MenuItem(id: 1, photo: ["https://images.unsplash.com/photo-1529006557810-274b9b2fc783?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=ae10582705f9402e297585fdb33b6348&auto=format&fit=crop&w=800&q=60"], description: "Beef Shawarma", menuDescription: "This is the perfect Beef Shawarma you will ever have.", menuCost: 11.99),MenuItem(id: 1, photo: ["https://images.unsplash.com/photo-1529006557810-274b9b2fc783?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=ae10582705f9402e297585fdb33b6348&auto=format&fit=crop&w=800&q=60"], description: "Beef Shawarma", menuDescription: "This is the perfect Beef Shawarma you will ever have.", menuCost: 11.99),MenuItem(id: 1, photo: ["https://images.unsplash.com/photo-1529006557810-274b9b2fc783?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=ae10582705f9402e297585fdb33b6348&auto=format&fit=crop&w=800&q=60"], description: "Beef Shawarma", menuDescription: "This is the perfect Beef Shawarma you will ever have.", menuCost: 11.99),MenuItem(id: 1, photo: ["https://images.unsplash.com/photo-1529006557810-274b9b2fc783?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=ae10582705f9402e297585fdb33b6348&auto=format&fit=crop&w=800&q=60"], description: "Beef Shawarma", menuDescription: "This is the perfect Beef Shawarma you will ever have.", menuCost: 11.99),MenuItem(id: 1, photo: ["https://images.unsplash.com/photo-1529006557810-274b9b2fc783?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=ae10582705f9402e297585fdb33b6348&auto=format&fit=crop&w=800&q=60"], description: "Beef Shawarma", menuDescription: "This is the perfect Beef Shawarma you will ever have.", menuCost: 11.99),MenuItem(id: 1, photo: ["https://images.unsplash.com/photo-1529006557810-274b9b2fc783?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=ae10582705f9402e297585fdb33b6348&auto=format&fit=crop&w=800&q=60"], description: "Beef Shawarma", menuDescription: "This is the perfect Beef Shawarma you will ever have.", menuCost: 11.99)
            ]),
        
        Restaurant(id: 2, name: "La Taqueria", photos: ["https://s3-media2.fl.yelpcdn.com/bphoto/quJVkgOw_pf70_enWelldw/o.jpg"], categories: ["mexican"], address: "2889 Mission St, San Francisco, CA", latitude: 37.750883, longitude: -122.418123, phoneNumber: "(415) 285-7117", menuItems: [
                MenuItem(id: 2, photo: ["https://thecozyapron.com/wp-content/uploads/2018/03/baja-fish-tacos_thecozyapron_1.jpg"], description: "Fish Tacos", menuDescription: "This is the perfect Fish Tacos  you will ever have.", menuCost: 10.99)
            ]),
        
        
        Restaurant(id: 3, name: "Uno Dos Tacos", photos: ["https://s3-media3.fl.yelpcdn.com/bphoto/e7GbDjpwY2-MS4FaR6VaRw/o.jpg"], categories: ["mexican"], address: "595 Market, San Francisco, CA", latitude: 37.7890148706099, longitude: -122.400831866272, phoneNumber: "(415) 974-6922", menuItems: [
            MenuItem(id: 0, photo: ["https://www.skinnytaste.com/wp-content/uploads/2013/04/easiest-crock-pot-salsa-verde-chicken-550x367.jpg"], description: "Slow-Cooked Salsa Verde Chicken Taco", menuDescription: "This is the perfect salsa verde Chicken Taco you will ever have.", menuCost: 7.99),
            MenuItem(id: 1, photo: ["https://images.unsplash.com/photo-1529006557810-274b9b2fc783?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=ae10582705f9402e297585fdb33b6348&auto=format&fit=crop&w=800&q=60"], description: "Beef Shawarma", menuDescription: "This is the perfect Beef Shawarma you will ever have.", menuCost: 13.99)
            ]),
        
        
        Restaurant(id: 4, name: "Taqueria Castillo Mason", photos: ["https://s3-media3.fl.yelpcdn.com/bphoto/1QOkkQUQD1E7erlUNTsiSg/o.jpg",], categories: ["mexican"], address: "10 Mason St, San Francisco, CA", latitude: 37.7836306, longitude: -122.408976, phoneNumber: "(415) 986-0426", menuItems: [
            MenuItem(id: 2, photo: ["https://thecozyapron.com/wp-content/uploads/2018/03/baja-fish-tacos_thecozyapron_1.jpg"], description: "Fish Tacos", menuDescription: "This is the perfect Fish Tacos you will ever have.", menuCost: 11.99)
        ]),
        
        
        Restaurant(id: 5, name: "Don Pisto's", photos: ["https://s3-media3.fl.yelpcdn.com/bphoto/c_LUncSy9yzzDRSYvPpoWw/o.jpg"], categories: ["mexican"], address: "510 Union St, San Francisco, CA", latitude: 37.80078, longitude: -122.40784, phoneNumber: "(415) 395-0939", menuItems: [
            MenuItem(id: 2, photo: ["https://thecozyapron.com/wp-content/uploads/2018/03/baja-fish-tacos_thecozyapron_1.jpg"], description: "Fish Tacos", menuDescription: "This is the perfect Beef Shawarma you will ever have.", menuCost: 11.99),
            MenuItem(id: 0, photo: ["https://www.skinnytaste.com/wp-content/uploads/2013/04/easiest-crock-pot-salsa-verde-chicken-550x367.jpg"], description: "Slow-Cooked Salsa Verde Chicken Taco", menuDescription: "This is the perfect low-Cooked Salsa Verde Chicken Taco you will ever have.", menuCost: 12.99),
            MenuItem(id: 1, photo: ["https://images.unsplash.com/photo-1529006557810-274b9b2fc783?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=ae10582705f9402e297585fdb33b6348&auto=format&fit=crop&w=800&q=60"], description: "Beef Shawarma", menuDescription: "This is the perfect Beef Shawarma you will ever have.", menuCost: 9.99)
        ]),
        
        
        Restaurant(id: 6, name: "Papi's", photos: ["https://s3-media2.fl.yelpcdn.com/bphoto/SJWDNJ_GEGkLzh9-ySPHLw/o.jpg",], categories: ["mexican"], address: "846 Geary St, San Francisco, CA", latitude: 37.7862679828077, longitude: -122.417218528234, phoneNumber: "(415) 800-8777", menuItems: [
            MenuItem(id: 1, photo: ["https://images.unsplash.com/photo-1529006557810-274b9b2fc783?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=ae10582705f9402e297585fdb33b6348&auto=format&fit=crop&w=800&q=60"], description: "Beef Shawarma",menuDescription: "This is the perfect Beef Shawarma you will ever have.", menuCost: 6.99),
            MenuItem(id: 2, photo: ["https://thecozyapron.com/wp-content/uploads/2018/03/baja-fish-tacos_thecozyapron_1.jpg"], description: "Fish Tacos", menuDescription: "This is the perfect Fish Tacos you will ever have.", menuCost: 11.99)
        ]),
        
        Restaurant(id: 7, name: "El Farolito", photos: ["https://s3-media1.fl.yelpcdn.com/bphoto/OPnKCvgBR2-lQ1-yahrpiA/o.jpg"], categories: ["mexican", "sandwiches"], address: "2779 Mission St, San Francisco, CA", latitude: 37.75265, longitude: -122.41812, phoneNumber: "(415) 824-7877", menuItems: [
            MenuItem(id: 2, photo: ["https://thecozyapron.com/wp-content/uploads/2018/03/baja-fish-tacos_thecozyapron_1.jpg"], description: "Fish Tacos", menuDescription: "This is the perfect Fish Tacos you will ever have.", menuCost: 10.99)
        ])
    ]
    
    static var carts: [Cart] = [Cart(photo:  ["https://thecozyapron.com/wp-content/uploads/2018/03/baja-fish-tacos_thecozyapron_1.jpg"], name: "Fish Tacos", menuCost: 10.99), Cart(photo:  ["https://images.unsplash.com/photo-1529006557810-274b9b2fc783?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=ae10582705f9402e297585fdb33b6348&auto=format&fit=crop&w=800&q=60"], name: "Beef Shawarma", menuCost: 9.99),Cart(photo:  ["https://thecozyapron.com/wp-content/uploads/2018/03/baja-fish-tacos_thecozyapron_1.jpg"], name: "Fish Tacos", menuCost: 10.99), Cart(photo: ["https://www.skinnytaste.com/wp-content/uploads/2013/04/easiest-crock-pot-salsa-verde-chicken-550x367.jpg"], name: "Slow-Cooked Salsa Verde Chicken Taco", menuCost: 12.99)]
}
