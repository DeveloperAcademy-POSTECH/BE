//
//  MenuViewModel.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/02.
//
//  화면 상단에 표시될 타이머를 표시합니다.

import Foundation
import Combine

final class MenuViewModel: ObservableObject {
    @Published var currenTime: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    let url = URL(string: "https://worldtimeapi.org/api/timezone/Asia/Tokyo")
    let formatter: DateFormatter = {
        let df = DateFormatter()
        df.timeStyle = .medium
        return df
    }()

    init() {
        getCurrentTime()
    }
    
    private func getCurrentTime()  {
        Timer.publish(every: 1, on: .main, in: .default)
            .autoconnect()
            .receive(on: RunLoop.main)
            .sink { value in
                self.currenTime = self.formatter.string(from: value)
            }
            .store(in: &cancellables)
    }
    
    private func timeValidator() async {
        guard let url = url else { return }
    
        let request = URLRequest(url: url)
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
    
            let _ = try JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
    
        } catch {
            print("✅ getTime Error: \(error)")
        }
    }
    
}// MenuViewModel
