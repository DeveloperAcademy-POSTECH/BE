//
//  VerificationCodeView.swift
//  BE
//
//  Created by GOngTAE on 2022/07/02.
//

import SwiftUI

struct VerificationCodeView: View {
    @State var verificationCode: String = ""
    @State var isComplete: Bool = false
    @State var timeString: String = "00:00"
    @State var isRetryEnable: Bool = true
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("인증번호를 입력해주세요.")
                    .font(.title2.bold())
                Spacer()
            }
            TextInputContainer(title: "인증번호", placeholder: "인증번호를 입력해주세요.", keyboardType: .numberPad, description: $verificationCode, isCompleted: $isComplete)
            HStack {
                Spacer()
                Image(systemName: "clock.arrow.circlepath")
                    .foregroundColor(.main)
                Text(timeString)
                    .foregroundColor(.main)
                retryButton
                    .onTapGesture {
                        
                    }
            }
        }
        .padding(.horizontal, 20)
    }
}

extension VerificationCodeView {
    var retryButton: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(isRetryEnable ? .main : .background)
                .frame(width: 84, height: 50)
            Text("재전송")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(isRetryEnable ? .white : .gray)
        }
    }
}

struct VerificationCodeView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationCodeView()
    }
}
