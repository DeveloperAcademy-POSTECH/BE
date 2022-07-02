//
//  MenuReviewContainer.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/03.
//

import SwiftUI

struct MenuReviewContainer: View {

    let menuName: String
    let price: Int
    @Binding var quantity: Int
    
    var body: some View {
        VStack {
            HStack {
                Text(menuName)
                    .font(.headline)

                Spacer()
            }
            
            HStack {
                Text("\(price)" + "원")
                
                Spacer()
                
                CustomStepper(quantity: $quantity)
            }
        }
        .padding(.vertical, 17)
        .padding(.leading, 16)
        .background(.white)
        .cornerRadius(10)
    }
}

struct MenuReviewContainer_Previews: PreviewProvider {
    static var previews: some View {
        MenuReviewContainer(
            menuName: "삼겹살",
            price: 5000,
            quantity: .constant(0)
        )
    }
}
