//
//  BiometricType.swift
//  SweetLog
//
//  Created by A_Mcflurry on 9/23/23.
//

import SwiftUI
import LocalAuthentication

extension UIDevice {
    var biometricType: BiometricType {
        let context = LAContext()
        var error: NSError?
        
        guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            return .none
        }
        
        if #available(iOS 11.0, *) {
            switch context.biometryType {
            case .faceID:
                return .faceID
            case .touchID:
                return .touchID
            default:
                return .none
            }
        } else {
            // iOS 10 및 이전에서는 Face ID가 없으므로 Touch ID만 있을 수 있습니다.
            return .touchID
        }
    }
}

enum BiometricType {
    case none
    case touchID
    case faceID
}
