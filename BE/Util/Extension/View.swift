//
//  View.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/02.
//
//  View 관련 extension을 관리합니다.

import SwiftUI

extension View {
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

    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
    
    // Rectangle의 일부분만 radius가 적용될 수 있도록 설정합니다.
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

// MARK: - cornerRadius handling function
fileprivate struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
