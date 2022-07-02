//
//  OrderModel.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/03.
//

import Foundation

struct OrderModel {
    let menuList: OrderElement
    let nickName: String
    let totalPrice: Int
}

struct OrderElement {
    let foodName: FoodName
    let plusSize: Bool
    let price: Int
    let quantity: Int
}
