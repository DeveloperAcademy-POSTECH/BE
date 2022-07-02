//
//  CartView.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/03.
//

import SwiftUI

struct CartView: View {
    
    @State var quantity: Int = 0
    
    var body: some View {
        VStack {
                // 상단 툴바
                UpperToolbar()
                    .padding(.horizontal, 24)
                    .padding(.bottom, 7)
                
                ZStack {
                    BackgroundRectangle()
                    
                    VStack {
                        MenuTitle()
                        
                        HStack {
                            Text("참서리")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                            
                            Spacer()
                        }
                        
                        // Menu Review List
                        ScrollView {
                            MenuReviewContainer(menuName: "3겹살", price: 5000, quantity: $quantity)
                            MenuReviewContainer(menuName: "4겹살", price: 10000, quantity: $quantity)
                            MenuReviewContainer(menuName: "5겹살", price: 10000, quantity: $quantity)
                            MenuReviewContainer(menuName: "6겹살", price: 10000, quantity: $quantity)
                            MenuReviewContainer(menuName: "7겹살", price: 10000, quantity: $quantity)
                        }
                        
                        HStack {
                            Text("총 주문금액")
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            Text("12,000" + "원")
                                .font(.title3)
                                .fontWeight(.semibold)
                        }
                        .padding(.top, 20)
                        
                        Spacer()
                        
                        LongBottomButton(
                            title: "주문하기",
                            backgroundColor: Color.main
                        )
                        
                        
                    }// VStack
                    .padding(.horizontal, 22)
                }// ZStack
        }// VStack
        .background(Color.main.ignoresSafeArea())
    }// body
}// CartView

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
