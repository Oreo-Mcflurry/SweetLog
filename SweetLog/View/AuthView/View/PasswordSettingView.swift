//
//  PasswordView.swift
//  SweetLog
//
//  Created by A_Mcflurry on 2023/09/14.
//

import SwiftUI

struct PasswordSettingView: View {
    @Binding var useFaceID: Bool
    @State var passwordInput: String = ""
    @State var password = "oooooo"
    @State private var isPasswordCheck = false
    @State var isComplete = false
    @Environment(\.dismiss) private var dismiss
    
	var body: some View {
            VStack {
                Text("암호를 입력해주세요")
                    .font(.title2)
                    .foregroundStyle(Color.label1)
                
                PasswordKeyboardView(passwordInput: $passwordInput, isUnlock: .constant(false), password: password, isSetting: true)
                    .onChange(of: passwordInput) { oldValue, newValue in
                        if newValue.count == password.count {
                            password = newValue
                            isPasswordCheck = true
                        }
                    }
                    .onAppear { if isComplete { dismiss() } }
                    .onDisappear { if !isPasswordCheck && !isComplete { useFaceID = false } }
            }
            .navigationDestination(isPresented: $isPasswordCheck) {
                PasswordSettingWithFaceID(useFaceID: $useFaceID, password: $password, isComplete: $isComplete)
                }
        .background {
            Color.backGround.ignoresSafeArea()
                .frame(width: UIWidth, height: UIHeight)
        }
    }
}

struct PasswordSettingWithFaceID: View {
    @Binding var useFaceID: Bool
    @Binding var password: String
    @Binding var isComplete: Bool
    @State var passwordCheck: String = ""
    @State private var isFailPassword = false
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack {
            Text(isFailPassword ? "비밀번호를 다시 입력해주세요" : "암호 확인을 위해 다시 입력해주세요")
                .font(.title2)
                .foregroundStyle(Color.label1)
            
            PasswordKeyboardView(passwordInput: $passwordCheck, isUnlock: .constant(false), password: password, isSetting: true)
                .onChange(of: passwordCheck) { oldValue, newValue in
                    if newValue.count == password.count {
                        if(newValue == password) {
                            authenticate { success in
                                if success {
                                    isComplete = true
                                    UserDefaults.standard.set(true, forKey: "useFaceID")
                                    UserDefaults.standard.set(password, forKey: "password")
                                    DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(floatLiteral: 1.0)) { dismiss() }
                                } else {
                                    isFailPassword = true
                                }
                            }
                        }
                        else { isFailPassword = true }
                    }
                }
        }
        .background {
            Color.backGround.ignoresSafeArea()
                .frame(width: UIWidth, height: UIHeight)
        }
    }
}

