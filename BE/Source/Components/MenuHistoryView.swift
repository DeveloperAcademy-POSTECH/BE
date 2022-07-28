//
//  MenuHistoryView.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/25.
//

import SwiftUI

struct MenuHistoryView: View {
    @State var quantity: Int

    let price: Int
    let menu: String
    var orderManager = OrderManager.shared

    var body: some View {
        VStack {
            HStack {
                Text(menu)
                    .font(.headline)

                Spacer()                
            }
            
            HStack {
                Text("\(price * quantity)" + "원")
                
                Spacer()
            }
            .padding(.top, 16)
        }
        .padding(.vertical, 17)
        .padding(.horizontal, 15)
        .background(.white)
        .cornerRadius(10)
        .onChange(of: quantity) { newValue in
            var newProductArray: [String] = []

            for _ in (0..<newValue) {
                newProductArray.append(menu)
            }
            orderManager.updateSelectedMenuQuantity(menuName: menu, newOrder: newProductArray)
        }
        
    }// body
}// MenuHistoryView

struct MenuHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        MenuHistoryView(
            quantity: 10,
            price: 5000,
            menu: "닭갈비덮밥"
        )
    }
}
