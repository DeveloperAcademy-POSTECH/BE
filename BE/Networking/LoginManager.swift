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
        UserDefaults.standard.set(phoneNumber, forKey: "phoneNumber")
        PhoneAuthProvider.provider()
            .verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
                if let error = error {
                    print("ERROR: \(error.localizedDescription)")
                } else {
                    UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
                    print("DEBUG: success - verify phoneNumber ")
                }
            }
    }
    
    func loginWith(verificationCode: String, completion: @escaping (_ result: AuthDataResult?, _ error: Error?) -> Void) {
        guard let verificationID = UserDefaults.standard.string(forKey: "authVerificationID") else { return }
        print("DEBUG: loginWith \(verificationID)")
        print("DEBUG: loginWith \(verificationCode)")
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID,
            verificationCode: verificationCode
        )
        Auth.auth().signIn(with: credential) { authResult, error in
            completion(authResult, error)
        }
    }
    
    func resend() {
        guard let phoneNumber = UserDefaults.standard.string(forKey: "phoneNumber") else { return }
        PhoneAuthProvider.provider()
            .verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
                if let error = error {
                    print("ERROR: \(error.localizedDescription)")
                } else {
                    UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
                }
            }
    }
}
