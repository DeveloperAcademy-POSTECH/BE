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
    @State var isComplete: Bool = false
    @State var verificationCode: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("전화번호를 입력해주세요.")
                    .font(.title2.bold())
                Spacer()
            }
            TextInputContainer(title: "전화번호", placeholder: "전화번호를 입력해주세요. (-없이 입력)", keyboardType: .numberPad, description: $phoneNumber, isCompleted: $isComplete)
        }
        .padding(.horizontal, 20)
    }
}

struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView()
    }
}
