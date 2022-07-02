//
//  OrderModel.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/03.
//

import Foundation

//"[{"oid": "여기에 id 오더마다 다르게 넣어주셈", "user": "A.Bethev", "menu": "닭갈비덮밥", "phoneNumber": "01051758832"}, {}, {}...]"

struct OrderModel: Identifiable {
    var id = UUID()
    
    let oid = UUID()
    let user: String
    let menu: String
    let phoneNumber: String
}

struct CartModel: Hashable {
    let foodName: String
    let size: String
    let price: Int
    let quantity: Int
}
