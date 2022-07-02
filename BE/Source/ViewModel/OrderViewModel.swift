//
//  OrderViewModel.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/03.
//

import Foundation

final class OrderViewModel: ObservableObject {
    @Published var orderList: [OrderModel] = []
    
    init() {
        print("Order View Model is working on!")
    }
    
    func addOrder(_ orderModel: OrderModel) {
        self.orderList.append(orderModel)
    }
}
