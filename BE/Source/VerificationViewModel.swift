//
//  VerificationViewModel.swift
//  BE
//
//  Created by GOngTAE on 2022/07/02.
//

import Foundation
import Combine

class VerificationViewModel: ObservableObject {
    let loginManager = LoginManager()
    @Published var phoneNumber: String = ""
    @Published var verificationCode: String = ""
    @Published var isComplete: Bool = false
    @Published var isRequest: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $phoneNumber
            .sink { inputValue in
                print("DEBUG: inputValue - \(inputValue)")
                guard self.phoneNumber.count == 11 else { return }
                self.requestVerificationCode()
                self.isRequest = true
            }
            .store(in: &cancellables)
    }
    func requestVerificationCode() {
        let globalNumString = "+16505553434"
        print("DEBUG: globalNumString \(globalNumString) ")
        self.loginManager.verify(phoneNumber: globalNumString)

    }
}
