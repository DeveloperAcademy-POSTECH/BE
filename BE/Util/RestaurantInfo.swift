//
//  RestaurantInfo.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/03.
//

import Foundation

struct Restaurant {
    static let restaurantName: String = "참서리"
    
    static let menuList: [MenuModel] = [
        MenuModel(foodName: .chicken, price: 5500, plusSize: nil),
        MenuModel(foodName: .pepper, price: 5500, plusSize: nil),
        MenuModel(foodName: .soysauce, price: 5500, plusSize: nil),
    ]
}
