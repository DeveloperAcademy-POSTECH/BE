//
//  MenuView.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/02.
//

import SwiftUI

struct MenuView: View {
    @StateObject var orderManager: OrderManager = OrderManager.shared
    @AppStorage("_isFirstLaunching") var isFirstLaunching: Bool = true
    @State var popToRoot: Bool = false
    @State var isShowFullModal: Bool = true {
        didSet {
            isFirstLaunching = isShowFullModal
        }
    }
    @State var showPicekrView = false {
        didSet {
            showPicekrView = !OrderManager.shared.fetchOrderAvailable()
        }
    }
    var menuList = [
        MenuModel(menu: .original, price: .normal),
        MenuModel(menu: .originalExtra, price: .extra),
        MenuModel(menu: .soySauce, price: .normal),
        MenuModel(menu: .soySauceExtra, price: .extra),
        MenuModel(menu: .pepper, price: .normal),
        MenuModel(menu: .peperExtra, price: .extra),
    ]
    
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
                            Text("참서리")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                            
                            Spacer()
                        }
                        .padding(.top, 13)
                        .padding(.bottom, 11)
                        
                        // Menu detail links
                        ForEach (self.menuList) { eachMenu in
                            NavigationLink (
                                destination: MenuDetailView(
                                    menuModel: eachMenu
                                )
                                .navigationBarHidden(true)
                            ) {
                                MenuDetailLink(foodName: eachMenu.menu)
                            }
                        }
                        
                        if (!orderManager.isSelectedMenuesEmpty()) {
                            HStack {
                                Spacer()
                                
                                NavigationLink(
                                    destination:
                                        CartView(
                                            orderManger: orderManager
                                        )
                                        .navigationBarHidden(true)
                                        .navigationTitle("")
                                ) {
                                    CartButton(
                                        quantity: orderManager.fetchSelectedMenuesCount()
                                    )
                                }
                            }// HStack
                        }
                        
                        Spacer()
                        
                    }
                    .padding(.horizontal, 22)
                    
                }//ZStack
                
            }// VStack
            .background(Color.main)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink(destination: MyOrderView().navigationTitle("MY애점")) {
                    Image(systemName: "person.fill")
                        .font(.title3)
                        .foregroundColor(.white)
                }
                
            }// NavigationView
            .fullScreenCover(isPresented: $isShowFullModal) {
                OnboardingTabView(isFirstLaunching: $isShowFullModal)
            }
            .fullScreenCover(isPresented: $showPicekrView) {
                
            }
            .accentColor(.white)
            
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
}
