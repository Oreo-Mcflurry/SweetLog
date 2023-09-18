//
//  FaceIDAuthExtension.swift
//  MessageBox
//
//  Created by A_Mcflurry on 2023/08/07.
//

import SwiftUI
import LocalAuthentication

extension View {
    func authenticate(isUnlock: Binding<Bool>, isPasswordView: Binding<Bool>) {
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
                    isPasswordView.wrappedValue = true
                }
            }
        }
    }
    
    func authenticate(completion: @escaping (Bool) -> Void) {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    print("제발 왜 안됨 대체")
                    completion(true) // 성공 시 true를 콜백으로 전달
                } else {
                    completion(false) // 실패 시 false를 콜백으로 전달
                }
            }
        } else {
            completion(false) // 바이오메트릭 인증을 사용할 수 없는 경우도 false를 콜백으로 전달
        }
    }
}
