//
//  RegisterSessionView.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/02.
//

import SwiftUI

struct RegisterSessionView: View {
    
    @State var isCompleted: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("오전/오후반이신가요?")
                        .font(.system(size: 22, weight: .bold))
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)

                HStack {
                    Button(action: {}) {
                        Text("오전반")
                    }
                    
                    Button(action: {}) {
                        Text("오후반")
                    }

                }

                Spacer()

                NavigationLink(destination: ContentView(), isActive: $isCompleted) {
                    EmptyView()
                }
            }

        }// NavigationView
    }// body
}// RegisterSessionView

struct RegisterSessionView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterSessionView()
    }
}
