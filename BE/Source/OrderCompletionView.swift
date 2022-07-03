//
//  OrderCompletionView.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/03.
//

import SwiftUI
import UniformTypeIdentifiers

struct OrderCompletionView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var orderViewModel: OrderViewModel
    
    var body: some View {
        VStack {
//            HStack {
//                Button(action: { presentationMode.wrappedValue.dismiss() }) {
//                    Image(systemName: "chevron.left")
//                        .font(.title3)
//                        .foregroundColor(.white)
//                }
//
//                Spacer()
//            }
//            .padding(.leading, 20)
            
            VStack {
                Spacer()
                
                Image(systemName: "checkmark")
                    .foregroundColor(.white)
                    .font(.title2)
                    .padding(.bottom, 20)
                
                Text("주문이 완료 되었습니다.\n오늘 오후 1시 까지\n아래 계좌로 입금을 완료해주세요.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.bottom, 45)
                    .lineSpacing(6)
                
                HStack {
                    Image(systemName: "shift.fill")
                        .rotationEffect(.degrees(-180))
                    Text("버튼을 클릭하여 복사하세요.")
                        .font(.footnote)
                        .foregroundColor(.black)
                }
                
                LongBottomButton(
                    title: "신협은행 132-024-256874 이명자",
                    backgroundColor: Color.container,
                    action: {
                        UIPasteboard.general.string = "132-024-256874"
                    }
                )
                
                HStack {
                    Image(systemName: "note.text")
                        .foregroundColor(.white)
                        .font(.headline)

                    Text("주문내역")
                        .font(.footnote)
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    Spacer()
                }
                .padding(.leading, 23)
                .padding(.bottom, 9)
                
                VStack {
                    ForEach(orderViewModel.cartOrders, id: \.self) {item in
                        HStack {
                            Text(item.foodName)

                            Spacer()

                            Text("\(item.quantity)")

                            Spacer()

                            Text("\(item.price)원")
                        }
                        .padding(17)

                    }

                }
                .background(.white)
                .cornerRadius(10)
                .padding(.horizontal, 20)

                
                Spacer()
                
            }
        }
        .background(Color.main)
    }
}

struct OrderCompletionView_Previews: PreviewProvider {
    static var previews: some View {
        OrderCompletionView()
    }
}
