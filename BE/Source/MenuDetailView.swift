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
    @State var quantity: Int = 0
    @State var totalCost: Int = 0
    @State var orderItemArray: [String] = []
//    @Binding var gobackFlag: Bool
    var menuModel: MenuModel
    
    func putItemInCartAndAddMenus() {
        for _ in (0..<quantity) {
            orderItemArray.append(menuModel.menu)
        }

        OrderManager.shared.addMenu(menus: orderItemArray)
        
        presentationMode.wrappedValue.dismiss()

    }
    
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
                    
                    Text(menuModel.menu)
                        .font(.title2)
                        .padding(.bottom, 24)
                    
                    HStack {
                        Text("가격")
                            .foregroundColor(Color.main)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 22)
                    
                    RadioButtonContainer(
                        title: menuModel.menu,
                        price: menuModel.price
                    )
                    .padding(.horizontal)
                    .transition(.opacity)
                    
                    HStack {
                        Text("수량")
                            .font(.title3)
                        
                        Spacer()
                        
                        CustomStepper(quantity: $quantity)
                            .onChange(of: quantity) { newValue in
                                self.totalCost = newValue * menuModel.price
                            }
                    }
                    .padding(.horizontal, 24)
                    
                    HStack {
                        Text("총 주문금액")
                            .font(.title3)
                        
                        Spacer()
                        
                        Text("\(totalCost)" + " 원")
                    }
                    .padding(.horizontal, 24)
                    
                    Spacer()
                    
                    LongBottomButton(
                        title: "\(quantity)개 담기",
                        backgroundColor: Color.container
                    ) {
                        putItemInCartAndAddMenus()
                    }
                    
                }// VStack
            }// ZStack
            
        }//VStack
        .background(Color.main.ignoresSafeArea())
    }// body
}// MenuDetailView

struct MenuDetailView_Previews: PreviewProvider {
    static let menuModel = MenuModel(menu: .original, price: .normal)
    
    static var previews: some View {
        MenuDetailView(menuModel: menuModel)
    }
}
