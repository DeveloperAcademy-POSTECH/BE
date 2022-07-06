//
//  RegisterNickNameViewModel.swift
//  BE
//
//  Created by GOngTAE on 2022/07/06.
//

import Foundation
import Combine

class RegisterNickNameViewModel: ObservableObject {
    @Published var userName: String = "" {
        didSet {
            let filtered = userName.filter { "abcdefghijklmnopqrstuvwxyz".contains($0) }
            print("DEBUG: filtered \(filtered)")
            print("DEBUG: userName \(userName)")
            if userName != filtered {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.02) {
                    self.userName = filtered
                }
            }
        }
    }
    func setUserName() {
        UserDefaults.standard.set(userName, forKey: "userName")
    }
}
