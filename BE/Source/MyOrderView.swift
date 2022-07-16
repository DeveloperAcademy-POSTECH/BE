//
//  MyOrderView.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/03.
//

import SwiftUI

struct MyOrderView: View {
    @State var showAlert: Bool = false
    @Environment(\.presentationMode) var presentationMode
    let orderManger = OrderManager.shared
    var totalPrice: Int {
        let menus = orderManger.fetchOrderHistory()
        var temp = 0
        for menu in menus {
            temp += menu.price * menu.quantity
        }
        
        return temp
    }
    
    var body: some View {
        VStack {            
            ZStack {
                BackgroundRectangle()
                
                VStack {
                    HStack {
                        Text("A.Dana")
                        
                        Spacer()
                    }
                    .padding(.vertical, 22)
                    
                    HStack {
                        Image(systemName: "note.text")
                        Text("주문 현황")
                        
                        Spacer()
                    }
                    .foregroundColor(Color.main)
                    .font(.headline)
                    
                    ScrollView {
                        ForEach(orderManger.fetchOrderHistory(), id: \.self) { item in
                            if item.quantity != 0 {
                                MenuReviewContainer(
                                    quantity: item.quantity,
                                    price: item.price,
                                    menu: item.name
                                )
                            }
                        }
                        
                        HStack {
                            Text("총 주문금액")
                            
                            Spacer()
                            
                            Text("\(totalPrice)")
                        }
                        .padding(17)
                    }
                    .background(Color.background)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    LongBottomButton(title: "주문 취소하기", backgroundColor: Color.container) {
                        self.showAlert.toggle()
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("주문취소"),
                            message: Text("정말 주문을 취소하시겠습니까? 취소 시 식사를 배달 받으실 수 있습니다."),
                            primaryButton: .default(
                                Text("뒤로가기"),
                                action: { }
                            ),
                            secondaryButton: .destructive(
                                Text("주문취소"),
                                action: {
                                    orderManger.cancellOrder()
                                    presentationMode.wrappedValue.dismiss()
                                }
                            )
                        )
                    }
                }
                .padding(.horizontal, 20)
                
            }// ZStack
            
        }// VStack
        .background(Color.main.ignoresSafeArea())
    }// body
}// MyOrderView

struct MyOrderView_Previews: PreviewProvider {
    static var previews: some View {
        MyOrderView()
    }
}
