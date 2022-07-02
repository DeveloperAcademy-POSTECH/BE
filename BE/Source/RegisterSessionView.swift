//
//  RegisterSessionView.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/02.
//

import SwiftUI

struct RegisterSessionView: View {
    @Binding var isFirstLaunching: Bool
    @State var isCompleted: Bool = false
    @State var selectedSession: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("오전/오후반이신가요?")
                    .font(.system(size: 22, weight: .bold))
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
            
            // Session Button Container
            HStack(spacing: 10) {
                SessionSelectionButton(
                    sessionName: "오전반",
                    selectedSession: $selectedSession
                )
                
                SessionSelectionButton(
                    sessionName: "오후반",
                    selectedSession: $selectedSession
                )
            }
            .frame(height: 82)
            
            Spacer()
            
            NavigationLink(
                destination: VerificationView(isFirstLaunching: $isFirstLaunching).navigationTitle(""),
                isActive: $isCompleted) {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.main)
                        .overlay(
                            Text("다음")
                                .font(.title2.bold())
                                .foregroundColor(.white)
                        )
                }
                .frame(height: 60)
        }//VStack
        .padding(.horizontal, 20)
        .padding(.top, 30)
    }// body
}// RegisterSessionView

struct RegisterSessionView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterSessionView(isFirstLaunching: .constant(true))
    }
}

// MARK: - 세션 선택 버튼
fileprivate struct SessionSelectionButton: View {
    
    let sessionName: String
    
    @Binding var selectedSession: String
    
    var body: some View {
        Button(action: {
            selectedSession = sessionName
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.background)
                    .overlay(
                        Text(sessionName)
                            .font(.headline)
                            .foregroundColor(selectedSession == sessionName ? Color.background : Color.container)
                    )
            }
        }
    }// body
}// SessionSelectionButton
