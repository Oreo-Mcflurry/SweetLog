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
            return .touchID
        }
    }
}

enum BiometricType {
    case none
    case touchID
    case faceID
}
