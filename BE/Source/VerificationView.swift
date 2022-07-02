//
//  VerificationView.swift
//  BE
//
//  Created by GOngTAE on 2022/07/02.
//

import SwiftUI

struct VerificationView: View {
    let loginManager = LoginManager()
    @State var phoneNumber: String = ""
    @State var verificationCode: String = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter Your PhoneNumber", text: $phoneNumber)
                    .padding()
                    .background(.gray.opacity(0.2))
                    .cornerRadius(20)
                Button("전송") {
                    loginManager.verify(phoneNumber: phoneNumber)
                }
            }
            HStack {
                TextField("Enter Your code", text: $verificationCode)
                    .padding()
                    .background(.gray.opacity(0.2))
                    .cornerRadius(20)
                Button("인증") {
                    loginManager.loginWith(verificationCode: verificationCode) { error in
                        if let error = error {
                            print("ERROR: 로그인 에러 \(error.localizedDescription)")
                        } else {
                            print("DEBUG: 로그인 성공")
                        }
                    }
                }
            }
        }
        .padding()
    }
}

struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView()
    }
}
