//
//  BackgroundRectangle.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/03.
//

import SwiftUI

struct BackgroundRectangle: View {
    var body: some View {
        Rectangle()
            .foregroundColor(Color.background)
            .ignoresSafeArea()
    }
}

struct BackgroundRectangle_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundRectangle()
    }
}
