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
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("오후 1시 전 어느 때나\n메뉴를 선택하고 계좌에 입금하면\n도시락을 받을 수 있습니다.\n\n1층에서 배달을 받을 사람은\n앱에서 랜덤으로 정해져\n문자를 받게 됩니다.")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        .lineSpacing(8)
                        Spacer()
                    }
                    Spacer()
                    
                }// VStack
                Spacer()
                NavigationLink {
                    RegisterNicknameView(isFirstLaunching: $isFirstLaunching)
                        .navigationTitle("")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(.white)
                        
                        Text("다음")
                            .font(.title2.bold())
                            .foregroundColor(.main)
                    }
                    .frame(height: 60)
                }
                Spacer()
            }// VStack
            .padding(.top, 170)
            .padding(.horizontal, 20)
            .background(Color.main.ignoresSafeArea())
            
        }// ZStack
    }// body
}// OnboardingLastView

struct OnboardingLastView_Previews: PreviewProvider {

    @State static var isFirstLaunching: Bool = true
    
    static var previews: some View {
        OnboardingLastView(isFirstLaunching: $isFirstLaunching)
    }
}
