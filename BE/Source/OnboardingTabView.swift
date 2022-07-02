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
        TabView {
            OnboardingFirstView()
            OnboardingLastView(isFirstLaunching: $isFirstLaunching)
        }
        .ignoresSafeArea()
        .tabViewStyle(PageTabViewStyle())
    }
}

struct OnboardingTabView_Previews: PreviewProvider {

    @State static var isFirstLaunching = true

    static var previews: some View {
        OnboardingTabView(isFirstLaunching: $isFirstLaunching)
    }
}
