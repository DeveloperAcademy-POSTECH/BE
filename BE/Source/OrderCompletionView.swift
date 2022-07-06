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
    @State var orderList : [MenuItem] = OrderManager.shared.fetchCountPerMenues()
    @State var accountNumberAnimation: Bool = true
    @State var isEnabled: Bool = true
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                
                Image(systemName: "checkmark")
                    .foregroundColor(.white)
                    .font(.title2)
                    .padding(.vertical, 20)
                    .padding(.top, 40)
                
                Text("주문이 완료 되었습니다.\n오늘 오후 1시 까지\n아래 계좌로 입금을 완료해주세요.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .lineSpacing(6)
                
                Button {
                    UIPasteboard.general.string = "132-024-256874"
                    
                    if isEnabled {
                        withAnimation(.spring()) {
                            accountNumberAnimation = false
                            isEnabled = false
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation(.spring()) {
                                
                                accountNumberAnimation = true
                                isEnabled = true
                            }
                        }
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(Color.container)
                        
                        ZStack {
                            Text(accountNumberAnimation ? "신협은행 132-024-256874 이명자" : "계좌번호가 복사되었습니다.")
                                .foregroundColor(.white)
                            
                            HStack {
                                Spacer()
                                Image(systemName: "square.on.square")
                                    .rotation3DEffect(.degrees(270), axis: (x: 0, y: 0, z: 1))
                                    .rotation3DEffect(.degrees(180), axis: (x: 1, y: 1, z: 0))
                                    .foregroundColor(.white)
                                    .frame(width: 44, height: 44, alignment: .trailing)
                                    .padding(.trailing, 20)
                            }
                        }
                    }
                }
                .frame(height: 60)
                .padding(20)
                
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
                
                ScrollView {
                    VStack {
                        ForEach(OrderManager.shared.fetchCountPerMenues(), id: \.self) { item in
                            if item.quantity != 0 {
                                HStack {
                                    Text(item.name)
                                        .frame(minWidth: 170, alignment: .leading)
                                    
                                    Spacer()
                                    
                                    Text("\(item.quantity)")
                                    
                                    Spacer()
                                    
                                    Text("\(item.price)")
                                }
                                .padding(17)
                            }
                        }
                    }
                }
                .background(.white)
                .cornerRadius(10)
                
                .padding(.horizontal, 20)
                
                Spacer()
                
                LongBottomButton(
                    title: "처음으로 돌아가기",
                    backgroundColor: Color.container,
                    action: {
                        NavigationUtil.popToRootView()
                        OrderManager.shared.clearSelectedMenues()
                    }
                )
                .padding(.vertical, 20)
                
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
