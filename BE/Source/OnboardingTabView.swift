//
//  OnBoardingTapView.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/02.
//

import SwiftUI

struct OnboardingTabView: View {
    @Binding var isFirstLaunching: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.main.ignoresSafeArea()
                
                VStack {
                    TabView {
                        Group {
                            OnboardingFirstView()
                            OnboardingSecondView()
                            OnboardingLastView(isFirstLaunching: $isFirstLaunching)
                        }
                        .padding(.top, 300)
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .navigationBarHidden(true)
                    .navigationTitle("")
                }
                .overlay(
                    VStack {
                        HStack {
                            Spacer()
                            
                            Image("azeomi")
                                .resizable()
                                .frame(width: 350, height: 350)
                            
                            Spacer()
                        }
                        .allowsHitTesting(false)
                        
                        Spacer()
                    }
                )// overlay
            }
        }// NavigationView
        .accentColor(.main)
    }// body
}// OnboardingTabView

struct OnboardingTabView_Previews: PreviewProvider {
    
    @State static var isFirstLaunching = true
    
    static var previews: some View {
        OnboardingTabView(isFirstLaunching: $isFirstLaunching)
    }
}
