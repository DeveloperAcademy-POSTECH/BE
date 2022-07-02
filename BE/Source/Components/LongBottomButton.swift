//
//  LongBottomButton.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/03.
//

import SwiftUI

struct LongBottomButton: View {
    
    let title: String
    let backgroundColor: Color
    let action: () -> ()
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(width: 300)
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
                .foregroundColor(backgroundColor == Color.background ? Color.container : Color.background)
                .background(backgroundColor)
                .cornerRadius(10)
        }
        .padding(.bottom)

    }
}

struct LongBottomButton_Previews: PreviewProvider {
    
    static var previews: some View {
        LongBottomButton(
            title: "Hello",
            backgroundColor: Color.main,
            action: {}
        )
    }
}
