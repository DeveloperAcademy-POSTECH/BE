//
//  MenuDetailLink.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/02.
//

import SwiftUI

struct MenuDetailLink: View {
    
    let foodName: String
    
    var body: some View {
            HStack {
                Text(foodName)
                    .foregroundColor(Color.container)
                    .font(.headline)
                    .padding(.leading, 17)
                    .padding(.vertical, 15)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.main)
                    .font(.title3)
                    .padding(.trailing, 19.5)
            }
            .background(.white)
            .cornerRadius(10)
            .padding(.bottom, 16)
        
    }// body
}// MenuDetailLink

struct MenuDetailLink_Previews: PreviewProvider {
    static var previews: some View {
        MenuDetailLink(foodName: "고추장불고기 덮밥")
    }
}
