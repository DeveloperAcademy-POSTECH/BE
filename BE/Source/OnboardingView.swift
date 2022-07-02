//
//  OnBoardingView.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/02.
//

import SwiftUI

struct OnboardingFirstView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("A.Zeom")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .bold))
                Text("은")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Spacer()
            }// HStack
            
            HStack {
                Text("A.Zit")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .bold))
                Text("에 계시는 분들께")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Spacer()
            }// HStack
            
            Text("간편한 점심식사 서비스를 제공합니다.")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.white)
           
            
            Spacer()
            
        }// VStack
        .padding(.top, 170)
        .padding(.horizontal, 20)
        .background(Color.main.ignoresSafeArea())
    }// body
}// OnBoardingView

struct OnboardingSecondView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("A.Zeom")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .bold))
                Text("은")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Spacer()
            }// HStack
            
     
            Text("매일 오후 1시에\n배달비 무료 1인 도시락을\nC5에 제공합니다.")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .lineSpacing(8)
    

            Spacer()
            
        }// VStack
        .padding(.top, 170)
        .padding(.horizontal, 20)
        .background(Color.main.ignoresSafeArea())
    }// body
}// OnBoardingView



struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingFirstView()
    }
}
