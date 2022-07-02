//
//  RadioButtonContainer.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/03.
//

import SwiftUI

struct RadioButtonContainer: View {
    
    let title: String
    let price: Int
    @Binding var isSelected: String
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .scale(0.5)
                    .foregroundColor(isSelected == title ? Color.main : Color.background)
                Circle()
                    .scale(0.25)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: 50, maxHeight: 60, alignment: .leading)
            
            Text(title)
                .font(.headline)
                .foregroundColor(Color.container)
            
            Spacer()
            
            Text("\(price)" + " 원")
                .font(.headline)
                .foregroundColor(Color.container)
        }
        .background(.white)
        .onTapGesture {
            withAnimation {
                self.isSelected = self.title
            }
        }
    }
}

struct RadioButtonContainer_Previews: PreviewProvider {
    
    static let title: String = "Hello"
    static var price: Int = 50
    @State static var isSelected: String = "기본"
    
    static var previews: some View {
        RadioButtonContainer(
            title: title,
            price: price,
            isSelected: $isSelected
        )
    }
}
