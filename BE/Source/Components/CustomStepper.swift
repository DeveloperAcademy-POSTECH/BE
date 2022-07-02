//
//  CustomStepper.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/03.
//

import SwiftUI

struct CustomStepper: View {
    
    @Binding var quantity: Int
    
    var body: some View {
        HStack {
            Spacer()
            
            HStack {
                Button(action: {
                    withAnimation {
                        if self.quantity > 0 {
                            self.quantity = self.quantity - 1
                        } else {
                            self.quantity = 0
                        }
                    }
                }) {
                    Image(systemName: "minus.square")
                        .foregroundColor(Color.container)
                        .transition(.opacity)
                        .font(.title3)
                }
                
                Text("\(self.quantity)")
                    .padding(.horizontal, 15)
                
                Button(action: {
                    withAnimation {
                        self.quantity = self.quantity + 1
                    }
                }) {
                    Image(systemName: "plus.square")
                        .foregroundColor(Color.container)
                        .transition(.opacity)
                        .font(.title3)
                }
            }
            .padding(.vertical, 18)
            .padding(.horizontal, 20)
            .background(.white)
            .cornerRadius(10)
        }
    }
}

struct CustomStepper_Previews: PreviewProvider {
    static var previews: some View {
        CustomStepper(quantity: .constant(0))
    }
}
