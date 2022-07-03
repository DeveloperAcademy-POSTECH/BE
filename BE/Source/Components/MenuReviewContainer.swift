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
    let quantity: Int
    let size: String
    
    var body: some View {
        VStack {
            HStack {
                Text(menuName + " (\(size))")
                    .font(.headline)

                Spacer()
            }
            
            HStack {
                Text("\(price)" + "원")
                
                Spacer()
                
                Text("\(quantity)")
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
            quantity: 10,
            size: "기본"
        )
    }
}
