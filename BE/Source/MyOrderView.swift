//
//  MyOrderView.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/03.
//

import SwiftUI

struct MyOrderView: View {
    
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack {
            Text("MY애점")
                .foregroundColor(.white)
            
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
                    
                    VStack (spacing: 0) {
                        HStack {
                            Text("삼겹살")
                            
                            Spacer()
                            
                            Text("1")
                            
                            Spacer()
                            
                            Text("6,500원")
                        }
                        .padding(17)
                        
                        HStack {
                            Text("삼겹살")
                            
                            Spacer()
                            
                            Text("1")
                            
                            Spacer()
                            
                            Text("6,500원")
                        }
                        .padding(17)

                        HStack {
                            Text("총 주문금액")
                            
                            Spacer()
                            
                            Text("12,000원")
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
                                Text("취소"),
                                action: { }
                            ),
                            secondaryButton: .destructive(
                                Text("확인"),
                                action: { }
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
