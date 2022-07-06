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
                        .padding(.top, UIScreen.main.bounds.height >= 812 ? 300 : 150)
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
                                .resizeLogo()

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
            .previewDevice("iPod touch (7th generation)")
    }
}


extension Image {
    func resizeLogo() -> some View {
        let height = UIScreen.main.bounds.height

        switch Int(height) {
        case ...812:
            return self.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 350 / 844 * height)

        default:
            return self.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 350)
        }
    }
}
