//
//  LoginManager.swift
//  BE
//
//  Created by GOngTAE on 2022/07/02.
//

import FirebaseAuth
import Foundation

class LoginManager {
    func verify(phoneNumber: String) {
        PhoneAuthProvider.provider()
            .verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
                if let error = error {
                    print("ERROR: \(error.localizedDescription)")
                } else {
                    UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
                }
            }
    }
    
    func loginWith(verificationCode: String, completion: @escaping (Error?) -> Void) {
        guard let verificationID = UserDefaults.standard.string(forKey: "authVerificationID") else { return }
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: verificationCode)
        
        Auth.auth().signIn(with: credential) { authResult, error in
            completion(error)
        }
    }
}
