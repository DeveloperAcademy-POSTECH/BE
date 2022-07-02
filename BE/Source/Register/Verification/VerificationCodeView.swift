//
//  VerificationCodeView.swift
//  BE
//
//  Created by GOngTAE on 2022/07/02.
//

import SwiftUI

struct VerificationCodeView: View {
    @Binding var isFirstLaunching: Bool
    @StateObject var vm = VerificationCodeViewModel()
    
    var body: some View {
        VStack {
            VStack(spacing: 17) {
                HStack {
                    Text("인증번호를 입력해주세요.")
                        .font(.title2.bold())
                    Spacer()
                }
                TextInputContainer(title: "인증번호", placeholder: "인증번호를 입력해주세요.", keyboardType: .default, description: $vm.verificationCode, isCompleted: $vm.isComplete)
                HStack {
                    Spacer()
                    Image(systemName: "clock.arrow.circlepath")
                        .foregroundColor(.main)
                    Text(vm.timeString)
                        .foregroundColor(.main)
                    ActionContainer(text: "재전송")
                        .onTapGesture {
                            vm.loginManager.resend()
                        }
                    ActionContainer(text: "완료")
                        .onTapGesture {
                            vm.verifyCode()
                        }
                }
                if vm.isValidCode ?? false {
                    Button {
                        //Dismiss
                        isFirstLaunching = false
                    } label: {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(.main)
                            .overlay(
                                Text("시작하기")
                                    .font(.title2.bold())
                                    .foregroundColor(.white)
                            )
                    }
                .frame(height: 60)
                }
            }
            .padding(.horizontal, 20)
//            .padding(.top, 30)
            Spacer()
        }
    }
}

struct ActionContainer: View {
    var text: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.main)
                .frame(width: 84, height: 50)
            Text(text)
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
    }
}

extension VerificationCodeView {

}

struct VerificationCodeView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationCodeView(isFirstLaunching: .constant(true))
    }
}
