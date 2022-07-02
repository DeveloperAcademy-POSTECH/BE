//
//  MenuView.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/02.
//

import SwiftUI

struct MenuView: View {

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("\(Text("A.zit").font(.system(size:40)))에서\n맛있는 점심 드실래요?")
                        .foregroundColor(.white)
                        .font(.title2)
                    Spacer()
                }
                .padding([.leading, .bottom], 30)
                
                // Menu Section
                ZStack {
                    BackgroundRectangle()
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                        .ignoresSafeArea()
                    
                    VStack {
                        MenuTitle()
                        
                        // Restaurant Name
                        HStack {
                            Text("참서리")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                            
                            Spacer()
                        }
                        .padding(.top, 13)
                        .padding(.bottom, 11)
                        
                        // Menu detail links
                        ForEach (0..<3) { _ in
                            NavigationLink (destination: MenuDetailView().navigationBarHidden(true)) {
                                MenuDetailLink()
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal, 22)
                    
                }//ZStack
                
            }// VStack
            .background(Color.main)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    UpperToolbar()
                    .padding(.top, 21)
                    .padding(.bottom, 44)
                }
            }
            
        }// NavigationView
    }// body
}// MenuView

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
