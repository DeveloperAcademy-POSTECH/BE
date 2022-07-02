//
//  VerificationView.swift
//  BE
//
//  Created by GOngTAE on 2022/07/02.
//

import SwiftUI
import FirebaseAuth

struct VerificationView: View {
    @Binding var isFirstLaunching: Bool
    @StateObject var vm = VerificationViewModel()
    @State var isComplete = false
    @State var showCodeView: Bool = false
    
    var body: some View {
        VStack {
            VStack(spacing: 17) {
                HStack {
                    Text("전화번호를 입력해주세요.")
                        .font(.title2.bold())
                    Spacer()
                }
                TextInputContainer(title: "전화번호", placeholder: "전화번호를 입력해주세요. (-없이 입력)", keyboardType: .numberPad, description: $vm.phoneNumber, isCompleted: $isComplete)
            }
            
            Spacer()
            
            if vm.isValidNumber {
                NavigationLink(isActive: $vm.isValidNumber) {
                    VerificationCodeView(isFirstLaunching: $isFirstLaunching)
                        .onOpenURL { url in
                            print("Received URL: \(url)")
                            Auth.auth().canHandle(url) // <- just for information purposes
                        }
                        .navigationTitle("")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(.main)
                        
                        Text("다음")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
                .frame(height: 60)
            }
        }
        .padding(.horizontal, 20)
//        .padding(.top, 30)
    }
}

struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView(isFirstLaunching: .constant(true))
    }
}
