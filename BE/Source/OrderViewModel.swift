//
//  OrderViewModel.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/03.
//

import Foundation

class OrderViewModel: ObservableObject {
    @Published var userModel: [UserModel] = []
    
    init() {
        print("Order View Model is working on")
    }
    
    func getOrder(_ order: OrderModel) {
        self.userModel.append(order)
    }
}
