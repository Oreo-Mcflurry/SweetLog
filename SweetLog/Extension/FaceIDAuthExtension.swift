//
//  FaceIDAuthExtension.swift
//  MessageBox
//
//  Created by A_Mcflurry on 2023/08/07.
//

import SwiftUI
import LocalAuthentication

extension View {
    func authenticate(isUnlock: Binding<Bool>) {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    print("Return True")
                    isUnlock.wrappedValue = true
                } else {
                    // there was a problem
                }
            }
        }
    }
}
