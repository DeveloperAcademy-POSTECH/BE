//
//  ContentView.swift
//  BE
//
//  Created by GOngTAE on 2022/07/02.
//

import SwiftUI

struct ContentView: View {
    
    //OnBoarding
    @AppStorage("_isFirstLaunching") var isFirstLaunching: Bool = true
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .fullScreenCover(isPresented: $isFirstLaunching) {
                OnboardingTabView(isFirstLaunching: $isFirstLaunching)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
