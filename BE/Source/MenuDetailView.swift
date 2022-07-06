//
//  MenuDetailView.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/02.
//

import SwiftUI

struct MenuDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
//    @EnvironmentObject var orderViewModel: OrderViewModel
    @State var price: Int = 0
    @State var isSelected: String = "기본"
    @State var quantity: Int = 0
    @State var totalCost: Int = 0
    
    let menuModel: MenuModel
    let normalSize: String = "기본"
    let plusSize: String = "곱빼기"
    
    //nickName:String, foodName: FoodName, size: String, price: Int, quantity: Int, totalPrice: Int
//    func dummyFunction() {
//        let order: OrderModel = OrderModel(
//            id: UUID(),
//            user: "bethev",
//            menu: menuModel.foodName.rawValue,
//            phoneNumber: "01011112222"
//        )
//
//        for _ in (0..<quantity) {
//            orderViewModel.getOrder(order)
//        }
//
//        let cart: CartModel = CartModel(
//            foodName: menuModel.foodName.rawValue,
//            size: self.isSelected,
//            price: self.totalCost,
//            quantity: self.quantity
//        )
//
//        orderViewModel.putInCart(cart)
//
//        presentationMode.wrappedValue.dismiss()
//    }
    
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
                    
                    Text(menuModel.foodName.rawValue)
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
                            title: normalSize,
                            price: menuModel.price,
                            isSelected: $isSelected
                        )
                        .transition(.opacity)
                        RadioButtonContainer(
                            title: plusSize,
                            price: menuModel.price + 1000,
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
                            .onChange(of: quantity) { newValue in
                                if isSelected == "기본" {
                                    self.totalCost = menuModel.price * newValue
                                } else {
                                    self.totalCost = (menuModel.price + 1000) * newValue
                                }
                            }
                            .onChange(of: isSelected) { newValue in
                                switch newValue {
                                case "기본":
                                    return self.totalCost = menuModel.price * quantity
                                case "곱빼기":
                                    return self.totalCost = (menuModel.price + 1000) * quantity
                                default:
                                    return
                                }
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
                    
                    LongBottomButton(title: "\(quantity)개 담기", backgroundColor: Color.container) {
                        for i in 0..<quantity {
                            var string = menuModel.foodName
                            OrderManager.shared.addMenu(menus: [])
                        }
                    }
                    
                }// VStack
            }// ZStack
        }//VStack
        .background(Color.main.ignoresSafeArea())
    }// body
}// MenuDetailView

struct MenuDetailView_Previews: PreviewProvider {
    static let menuModel = MenuModel(foodName: .pepper, price: 5500, plusSize: true)
    
    static var previews: some View {
        MenuDetailView(menuModel: menuModel)
    }
}
