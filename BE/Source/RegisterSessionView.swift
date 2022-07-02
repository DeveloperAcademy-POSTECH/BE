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
                HStack {
                    SessionSelectionButton(
                        sessionName: "오전반",
                        selectedSession: $selectedSession
                    )
                    
                    SessionSelectionButton(
                        sessionName: "오후반",
                        selectedSession: $selectedSession
                    )
                }

                Spacer()

                NavigationLink(
                    destination: VerificationView().navigationTitle(""),
                    isActive: $isCompleted) {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.blue)
                }
                    .frame(height: 60)
                
                
            }//VStack
            .padding(.horizontal, 20)
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
            Text(sessionName)
                .font(.headline)
                .foregroundColor(selectedSession == sessionName ? Color.background : Color.container)
                .padding(.vertical, 27)
                .padding(.horizontal, 56)
                .background(selectedSession == sessionName ? Color.main : Color.background)
                .cornerRadius(12)
        }

    }// body
}// SessionSelectionButton
