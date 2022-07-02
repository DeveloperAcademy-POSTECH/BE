//
//  MenuDetailView.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/02.
//

import SwiftUI

struct MenuDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var price: Int = 0
    @State var isSelected: String = "기본"
    @State var quantity: Int = 0
    
    let title1: String = "기본"
    let title2: String = "곱빼기"
    
    func dummyFunction() { }
    
    var body: some View {
        VStack {
            // 상단 툴바
            UpperToolbar()
            .padding(.horizontal, 24)
            .padding(.bottom, 7)
            
            // 메뉴 선정
            ZStack {
                BackgroundRectangle()
                
                VStack {
                    MenuTitle()
                        .padding(.vertical, 10)
                    
                    Text("고추장불고기 덮밥")
                        .font(.title2)
                        .padding(.bottom, 24)
                    
                    HStack {
                        Text("가격")
                            .foregroundColor(Color.main)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 22)
                    
                    List {
                        RadioButtonContainer(
                            title: title1,
                            price: $price,
                            isSelected: $isSelected
                        )
                        .transition(.opacity)
                        RadioButtonContainer(
                            title: title2,
                            price: $price,
                            isSelected: $isSelected
                        )
                        .transition(.opacity)
                    }
                    .frame(maxHeight: 150)
                    
                    HStack {
                        Text("수량")
                            .font(.title3)
                        
                        Spacer()
                        
                        CustomStepper(quantity: $quantity)
                    }
                    .padding(.horizontal, 24)
                    
                    HStack {
                        Text("총 주문금액")
                            .font(.title3)
                        
                        Spacer()
                        
                        Text("0" + " 원")
                    }
                    .padding(.horizontal, 24)
                    
                    Spacer()
                    
                    LongBottomButton(
                        title: "\(quantity)개 담기",
                        backgroundColor: Color.container,
                        action: dummyFunction
                    )
                    
                }// VStack
            }// ZStack
        }//VStack
        .background(Color.main.ignoresSafeArea())
    }// body
}// MenuDetailView

struct MenuDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MenuDetailView()
    }
}
