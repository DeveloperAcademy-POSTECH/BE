//
//  VerificationCodeViewModel.swift
//  BE
//
//  Created by GOngTAE on 2022/07/02.
//

import Foundation
import Combine

class VerificationCodeViewModel: ObservableObject {
    var loginManager = LoginManager.shared
    @Published var verificationCode: String = "" {
        didSet {
            let filtered = verificationCode.filter { "0123456789".contains($0) }
            print("DEBUG: filtered \(filtered)")
            print("DEBUG: userName \(verificationCode)")
            if verificationCode != filtered {
                DispatchQueue.main.async {
                    self.verificationCode = filtered
                }
            }
        }
    }
    @Published var isComplete: Bool = false
    @Published var isRetryEnable: Bool = true
    @Published var isVerify: Bool = false
    @Published var isValidCode: Bool? = nil
    @Published var timeString: String = "00:00"
    
    private var lock = false
    private let verifyCodeSubject = CurrentValueSubject<Bool?, Never>(nil)
    private var cancellables = Set<AnyCancellable>()
    
    init() {
//        $verificationCode
//            .sink { inputValue in
//                print("DEBUG: inputValue - \(inputValue)")
//                if inputValue.count == 6 {
//                    self.verifyCode()
//                }
//            }
//            .store(in: &cancellables)
    }
    
    func resendCode() {
        loginManager.resend()
    }
    
    func verifyCode() {
        if !lock {
            lock = true
            loginManager.loginWith(verificationCode: verificationCode) { result, error in
                print("DEBUG: verificationCode - \(self.verificationCode)")
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    self.isValidCode = true
                }
                self.lock = false
            }
        }
    }
}
