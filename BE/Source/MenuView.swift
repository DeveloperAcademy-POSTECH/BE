//
//  MenuView.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/02.
//

import SwiftUI

struct MenuView: View {
//    @EnvironmentObject var orderViewModel: OrderViewModel

    @AppStorage("_isFirstLaunching") var isFirstLaunching: Bool = true
    @State var isShowFullModal: Bool = true {
        didSet {
            isFirstLaunching = isShowFullModal
        }
    }
    @State var showPicekrView: Bool = false {
        didSet {
            showPicekrView = !OrderManager.shared.fetchOrderAvailable()
        }
    }

    
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
                            Text(Restaurant.restaurantName)
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                            
                            Spacer()
                        }
                        .padding(.top, 13)
                        .padding(.bottom, 11)
                        
                        // Menu detail links
                        ForEach (Restaurant.menuList, id: \.self) { menuInfo in
                            NavigationLink (
                                destination: MenuDetailView(menuModel: menuInfo).navigationBarHidden(true)
                            ) {
                                MenuDetailLink(foodName: menuInfo.foodName.rawValue)
                            }
                        }
                        
//                        if (!orderViewModel.orders.isEmpty) {
                        if(!OrderManager.shared.isSelectedMenuesEmpty()) {
                            HStack {
                                Spacer()
                                
                                NavigationLink(
                                    destination:
                                        CartView()
                                        .navigationBarHidden(true)
                                        .navigationTitle("")
                                ) {
//                                    CartButton(quantity: orderViewModel.orders.count)
                                    CartButton(quantity: OrderManager.shared.fetchSelectedMenuesCount())
                                }
                            }
                        }
                        
                        Spacer()
                        
                    }
                    .padding(.horizontal, 22)
                    
                }//ZStack
                
            }// VStack
            .background(Color.main)
            .navigationBarTitleDisplayMode(.inline)
            
        }// NavigationView
        .fullScreenCover(isPresented: $isShowFullModal) {
            OnboardingTabView(isFirstLaunching: $isShowFullModal)
        }
        .fullScreenCover(isPresented: $showPicekrView) {
            PickerView()
        }
        .accentColor(.white)
        .navigationTitle("")
    }// body
}// MenuView

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct CartButton: View {
    
    let quantity: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.main)
                .frame(maxWidth: 65, maxHeight: 65)
            
            Image(systemName: "cart.fill")
                .foregroundColor(.background)
                .font(.largeTitle)
            
            ZStack {
                Circle()
                    .foregroundColor(.background)
                    .frame(maxWidth: 25, maxHeight: 25)
                    .padding(.leading, 30)
                    .padding(.bottom, 25)

                Text("\(quantity)")
                    .foregroundColor(.main)
                    .padding(.leading, 30)
                    .padding(.bottom, 25)

            }
        }
    }
}
