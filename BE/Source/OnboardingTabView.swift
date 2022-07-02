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
            TabView {
                OnboardingFirstView()
                OnboardingLastView(isFirstLaunching: $isFirstLaunching)
            }
            .ignoresSafeArea()
        .tabViewStyle(PageTabViewStyle())
        }
        .accentColor(.main)
    }
}

struct OnboardingTabView_Previews: PreviewProvider {

    @State static var isFirstLaunching = true

    static var previews: some View {
        OnboardingTabView(isFirstLaunching: $isFirstLaunching)
    }
}
