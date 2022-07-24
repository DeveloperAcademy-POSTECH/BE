//
//  CurrentTimeContainer.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/02.
//

import SwiftUI

struct UpperToolbar: View {
    @ObservedObject var menuViewModel: MenuViewModel = MenuViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack {
            Button(action: { presentationMode.wrappedValue.dismiss() }) {
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .foregroundColor(.white)
                
            }
            
            Spacer()
            
            HStack {
                Image(systemName: "clock")
                
                Text(menuViewModel.currenTime)
            }
            
            Spacer()
            
            NavigationLink(destination: MyOrderView().navigationTitle("")) {
                Image(systemName: "person.fill")
                    .font(.title3)
                    .foregroundColor(.white)
            }
        }
    }// body
}// UpperToolbar

struct CurrentTimeContainer_Previews: PreviewProvider {
    static var previews: some View {
        UpperToolbar()
    }
}
