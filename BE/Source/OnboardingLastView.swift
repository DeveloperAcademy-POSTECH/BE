//
//  OnboardingLastView.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/02.
//

import SwiftUI

struct OnboardingLastView: View {
    
    @Binding var isFirstLaunching: Bool
    
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("온보딩 마지막 뷰 테스트")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .bold))
                    
                    Spacer()
                }// HStack
                .padding(.horizontal, 20)
                
                Spacer()
                
                // Onboarding dismiss button
                Button(action: {
                    isFirstLaunching.toggle()
                }) {
                    Text("텍스트")
                        .foregroundColor(.white)
                }
                
                NavigationLink {
                    RegisterNicknameView(isFirstLaunching: $isFirstLaunching)
                        .navigationTitle("")
                } label: {
                    Text("텍스트")
                .foregroundColor(.white)
                }

                
                Spacer()

            }// VStack
            .padding(.top, 170)
            
        }// ZStack
    }// body
}// OnboardingLastView

struct OnboardingLastView_Previews: PreviewProvider {

    @State static var isFirstLaunching: Bool = true
    
    static var previews: some View {
        OnboardingLastView(isFirstLaunching: $isFirstLaunching)
    }
}
