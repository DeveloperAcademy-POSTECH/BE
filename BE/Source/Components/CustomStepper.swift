//
//  CustomStepper.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/03.
//

import SwiftUI

struct CustomStepper: View {
    
    @Binding var quantity: Int
    @State var increaseStepper: Bool = false
    @State var decreaseStepper: Bool = false
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    self.decreaseStepper = true
                    if self.quantity > 0 {
                        self.quantity = self.quantity - 1
                    } else {
                        self.quantity = 0
                    }
                }
            }) {
                ExtractedView(
                    trigger: $decreaseStepper,
                    iconName: "minus.square"
                )
            }
            
            Text("\(self.quantity)")
                .padding(.horizontal, 15)
            
            Button(action: {
                withAnimation {
                    self.increaseStepper = true
                    self.quantity = self.quantity + 1
                }
            }) {
                ExtractedView(
                    trigger: $increaseStepper,
                    iconName: "plus.square"
                )
            }
        }
    }
}

struct CustomStepper_Previews: PreviewProvider {
    static var previews: some View {
        CustomStepper(quantity: .constant(0))
    }
}

fileprivate struct ExtractedView: View {
    @Binding var trigger: Bool
    let iconName: String
    
    var body: some View {
        Image(systemName: trigger ? "\(iconName).fill" : iconName)
            .transition(.opacity)
            .font(.title3)
            .foregroundColor(trigger ? Color.main : Color.container)
            .onChange(of: trigger) { newValue in
                if newValue == true {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        withAnimation {
                            self.trigger.toggle()
                        }
                    }
                }
            }
    }
}
