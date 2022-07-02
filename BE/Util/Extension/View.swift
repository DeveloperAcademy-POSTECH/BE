//
//  View.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/02.
//
//  View 관련 extension을 관리합니다.

import SwiftUI

// TextField의 placeholder 텍스트의 color를 설정합니다.
/*
 사용 예시는 아래와 같습니다. 입력받은 텍스트가 없는 경우 gray color의 placeholder 표시
 TextField("", text: $description)
     .font(.system(size: 16, weight: .regular))
     .placeholder(when: description.isEmpty) {
             Text(placeholder)
                 .foregroundColor(.gray)
     }
 */
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
