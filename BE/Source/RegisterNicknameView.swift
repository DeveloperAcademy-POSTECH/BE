//
//  RegisterNicknameView.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/02.
//

import SwiftUI

struct RegisterNicknameView: View {
    @StateObject var vm = RegisterNickNameViewModel()
    let title: String = "닉네임"
    let placeholder: String = "닉네임을 입력해주세요(영어 입력)"

    @Binding var isFirstLaunching: Bool
    @State var isCompleted: Bool = false
    
    var body: some View {
            VStack {
                HStack {
                    Text("반가워요\n아카데미 닉네임이 어떻게 되시나요?")
                        .font(.system(size: 22, weight: .bold))
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                }
                
                TextInputContainer(
                    title: title,
                    placeholder: placeholder,
                    keyboardType: .alphabet,
                    description: $vm.userName,
                    isCompleted: $isCompleted
                )

                Spacer()

                NavigationLink(destination: RegisterSessionView(isFirstLaunching: $isFirstLaunching).navigationTitle(""), isActive: $isCompleted) {
                    EmptyView()
                }
                .navigationTitle("")
            }
            .padding(.horizontal, 20)
            .navigationTitle("")
            .onDisappear {
                vm.setUserName()
            }
    }// body
    
    //MARK: - Helpers

}// RegisterNicknameView

struct RegisterNicknameView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterNicknameView(isFirstLaunching: .constant(true))
    }
}
