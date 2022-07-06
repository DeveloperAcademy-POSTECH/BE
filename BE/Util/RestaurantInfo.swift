//
//  RestaurantInfo.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/03.
//

import Foundation

struct Restaurant {
    let restaurantName: String = "참서리"

    let menuList: [MenuModel] = [
        MenuModel(menu: .original, price: .normal),
        MenuModel(menu: .originalExtra, price: .extra),
        MenuModel(menu: .soySauce, price: .normal),
        MenuModel(menu: .soySauceExtra, price: .extra),
        MenuModel(menu: .pepper, price: .normal),
        MenuModel(menu: .peperExtra, price: .extra),
    ]
}

struct MenuModel: Hashable, Identifiable {
    let id = UUID()
    
    init(menu: ChamMenuName, price: ChamMenuPrice){
        self.menu = menu.rawValue
        self.price = price.rawValue
        
    }
    
    var menu: String
    var price: Int
}
