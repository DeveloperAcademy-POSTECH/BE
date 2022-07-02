//
//  RegisterNicknameView.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/02.
//

import SwiftUI

struct RegisterNicknameView: View {
    
    let title: String = "닉네임"
    let placeholder: String = "닉네임을 입력해주세요"
    
    @State var descripton: String = ""
    @State var isCompleted: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("반가워요\n아카데미 닉네임이 어떻게 되시나요?")
                        .font(.system(size: 22, weight: .bold))
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                
                TextInputContainer(
                    title: title,
                    placeholder: placeholder,
                    keyboardType: .default,
                    description: $descripton,
                    isCompleted: $isCompleted
                )

                Spacer()

                NavigationLink(destination: ContentView(), isActive: $isCompleted) {
                    EmptyView()
                }
            }

        }// NavigationView
    }// body
}// RegisterNicknameView

struct RegisterNicknameView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterNicknameView()
    }
}
