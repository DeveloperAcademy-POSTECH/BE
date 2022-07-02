//
//  VerificationView.swift
//  BE
//
//  Created by GOngTAE on 2022/07/02.
//

import SwiftUI
import FirebaseAuth

struct VerificationView: View {
    @StateObject var vm = VerificationViewModel()
    @State var isComplete = false
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 17) {
                    HStack {
                        Text("전화번호를 입력해주세요.")
                            .font(.title2.bold())
                        Spacer()
                    }
                    TextInputContainer(title: "전화번호", placeholder: "전화번호를 입력해주세요. (-없이 입력)", keyboardType: .numberPad, description: $vm.phoneNumber, isCompleted: $isComplete)
                    
                    if vm.isRequest {
                        NavigationLink {
                            VerificationCodeView()
                                .onOpenURL { url in
                                    print("Received URL: \(url)")
                                    Auth.auth().canHandle(url) // <- just for information purposes
                                }
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
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationTitle("")

                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 30)
               Spacer()
            }
        }
        .accentColor(.main)
    }
}

struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView()
    }
}
