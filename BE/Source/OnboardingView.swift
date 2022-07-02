//
//  OnBoardingView.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/02.
//

import SwiftUI

struct OnboardingFirstView: View {
    var body: some View {
        VStack {
            HStack {
                Text("환영합니다.\n\n소개 및 결제방식")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .bold))
                
                Spacer()
            }// HStack
            .padding(.horizontal, 20)
            
            Spacer()
            
        }// VStack
        .padding(.top, 170)
        .background(Color.main.ignoresSafeArea())
    }// body
}// OnBoardingView

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingFirstView()
    }
}
