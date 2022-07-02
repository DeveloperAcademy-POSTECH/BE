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
        VStack {
            ZStack {
                VStack (alignment: .leading) {
                    // 닉네임, 전화번호 등 타이틀을 설정합니다.
                    Text(title)
                        .foregroundColor(.red)
                        .font(.system(size: 16, weight: .medium))
                    
                    // 사용자의 텍스트를 입력받습니다.
                    TextField("", text: $description)
                        .keyboardType(keyboardType)
                        .font(.system(size: 22, weight: .regular))
                        .placeholder(when: description.isEmpty) {
                            Text(placeholder)
                                .foregroundColor(.blue)
                        }
                        .onSubmit {
                            self.isCompleted = true
                        }
                }
                .padding(.leading, 14)
                .padding(.vertical, 15)
            }// ZStack
            .background(.gray)
            .cornerRadius(12)
        }// VStack
        .padding(.horizontal, 20)
        
        
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
