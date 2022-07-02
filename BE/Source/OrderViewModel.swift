//
//  OrderViewModel.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/03.
//

import Foundation

class OrderViewModel: ObservableObject {
    @Published var orders: [OrderModel] = []
    
    init() {
        return
    }
    
    func getOrder(_ order: OrderModel) {
        self.orders.append(order)
    }
}
