//
//  ContentView.swift
//  BE
//
//  Created by GOngTAE on 2022/07/02.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var orderManager = OrderManager.shared
    // OnBoarding
    @AppStorage("_isFirstLaunching") var isFirstLaunching: Bool = true
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .fullScreenCover(isPresented: $isFirstLaunching) {
                OnboardingTabView(isFirstLaunching: $isFirstLaunching)
            }
            .onAppear {
                orderManager.order(with: OrderData(user: "A.Theo", menu: "간장닭갈비덮밥", lastPhoneNumber: "01098734972"))
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
