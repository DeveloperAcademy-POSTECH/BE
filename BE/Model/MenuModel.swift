//
//  MenuModel.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/03.
//

import Foundation

struct MenuModel: Hashable{
    let foodName: FoodName
    let price: Int
    let plusSize: Bool?
}

enum FoodName: String {
    case soysauce = "간장닭갈비 덮밥"
    case pepper = "고추장불고기 덮밥"
    case chicken = "닭갈비 덮밥"
}
