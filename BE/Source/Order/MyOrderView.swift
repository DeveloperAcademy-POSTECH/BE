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
            HStack {
                Text("A.Dana")
                
                Spacer()
            }
            
            HStack {
                Image(systemName: "note.text")
                Text("주문 현황")
                
                Spacer()
            }
            
            VStack {
                HStack {
                    Text("삼겹살")

                    Spacer()

                    Text("1")

                    Spacer()

                    Text("6,500원")
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
                        Text("확인"),
                        action: { }
                    ),
                    secondaryButton: .destructive(
                        Text("취소"),
                        action: { }
                    )
                )
            }

        }
        .background(Color.main)
    }
}

struct MyOrderView_Previews: PreviewProvider {
    static var previews: some View {
        MyOrderView()
    }
}
