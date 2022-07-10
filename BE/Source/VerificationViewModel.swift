//
//  VerificationViewModel.swift
//  BE
//
//  Created by GOngTAE on 2022/07/02.
//

import Foundation
import Combine

class VerificationViewModel: ObservableObject {
    var loginManager = LoginManager.shared
    @Published var phoneNumber: String = ""
    @Published var verificationCode: String = ""
    @Published var isComplete: Bool = false
    @Published var isValidNumber: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $phoneNumber
            .sink {  inputValue in
                print("DEBUG: inputValue - \(inputValue)")
                
                guard self.phoneNumber.count == 11 else { return }
                guard self.phoneNumber.substring(from: 0, to: 3) == "010" else { return }
                self.requestVerificationCode()
                self.isValidNumber = true
                print(self.isValidNumber)
            }
            .store(in: &cancellables)
    }
    func requestVerificationCode() {
        self.loginManager.verify(phoneNumber: phoneNumber)
    }
}
