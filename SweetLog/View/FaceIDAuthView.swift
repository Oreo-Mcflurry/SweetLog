//
//  FaceIDAuthView.swift
//  MessageBox
//
//  Created by A_Mcflurry on 2023/08/07.
//

import SwiftUI
import LocalAuthentication

struct FaceIDAuthView: View {
    @Binding var isUnlock: Bool
    @State var isPasswordView = false
    @State var passwordInput: String = ""
    // UserDefaults
    let password = UserDefaults.standard.string(forKey: "password") ?? "000000"
    @State private var isFailPassword = false
    var body: some View {
        VStack {
            if isPasswordView {
                Text(isFailPassword ? "비밀번호가 틀렸습니다" : "비밀번호 입력")
                    .font(.title2)
                    .foregroundStyle(Color.label1)
                PasswordKeyboardView(passwordInput: $passwordInput, isUnlock: $isUnlock, password: password)
                    .onChange(of: passwordInput) { oldValue, newValue in
                        if newValue.count == password.count {
                            if(newValue == password) { isUnlock = true }
                            else { isFailPassword = true }
                        }
                    }
            }
        }
        .background {
            Color.backGround.ignoresSafeArea()
                .frame(width: UIWidth, height: UIHeight)
        }
        .onAppear(perform: { authenticate(isUnlock: $isUnlock, isPasswordView: $isPasswordView) })
    }
}
