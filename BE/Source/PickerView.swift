//
//  PickerView.swift
//  BE
//
//  Created by Inho Choi on 2022/07/07.
//

import SwiftUI

struct PickerView: View {
    private var pickerName: String = ""
    
    init() {
        // TODO: pickerName 설정하기
    }

    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()

            VStack {
                Image("azeomi")
                    .resizeLogo()

                Text("오늘의 주문이 종료되었습니다.")
                    .foregroundColor(.white)
                    .font(.title3)
                    .padding(.bottom, 32)

                Text("오늘의 픽업 당첨자")
                    .foregroundColor(.white)
                    .font(.title3)
                if String(self.pickerName.split(separator: ".")[0]) == "A" {
                    Text("오후반 \(String(self.pickerName.split(separator: ".")[1]))")
                        .foregroundColor(.white)
                        .font(.title)
                        .padding(.bottom, 32)
                } else {
                    Text("오전반 \(String(self.pickerName.split(separator: ".")[1]))")
                        .foregroundColor(.white)
                        .font(.title)
                        .padding(.bottom, 32)
                }



                Text("픽업 당첨자는 오후 1시에")
                    .foregroundColor(.white)
                    .font(.title3)
                Text("C5 1층에서 도시락을 픽업하고,")
                    .foregroundColor(.white)
                    .font(.title3)
                Text("Azit으로 배달해주세요 :)")
                    .foregroundColor(.white)
                    .font(.title3)

                Spacer()
            }
        }
    }
}



struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
            .previewDevice("iPhone 13 Pro Max")
    }
}
