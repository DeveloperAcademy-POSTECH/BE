//
//  TextInputContainer.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/02.
//
//  TextInputContainer는 닉네임, 전화번호 등 회원가입 시 텍스트를 입력받습니다.

import SwiftUI

struct TextInputContainer: View {
    
    let title: String
    let placeholder: String
    let keyboardType: UIKeyboardType
    
    @Binding var description: String
    @Binding var isCompleted: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            // 닉네임, 전화번호 등 타이틀을 설정합니다.
            Text(title)
                .foregroundColor(Color.main)
                .font(.subheadline)
            
            // 사용자의 텍스트를 입력받습니다.
            TextField("", text: $description)
                .keyboardType(keyboardType)
                .font(.title2)
                .placeholder(when: description.isEmpty) {
                    Text(placeholder)
                        .foregroundColor(.gray)
                }
                .onSubmit {
                    self.isCompleted = true
                }

        }// VStack
        .padding(.leading, 14)
        .padding(.vertical, 15)
        .background(Color.background)
        .frame(height: 82)
        .cornerRadius(12)
    }// body
}// TextInputContainer

struct TextInputContainer_Previews: PreviewProvider {
    
    @State static var description = "01023456789"
    @State static var isCompleted = false
    
    static var previews: some View {
        TextInputContainer(
            title: "Phone Number",
            placeholder: "Please type your phonenumber.",
            keyboardType: .numberPad,
            description: $description,
            isCompleted: $isCompleted
        )
    }
}
