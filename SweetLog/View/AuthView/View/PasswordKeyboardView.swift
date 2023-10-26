//
//  PasswordKeyboardView.swift
//  SweetLog
//
//  Created by A_Mcflurry on 2023/09/16.
//

import SwiftUI

struct PasswordKeyboardView: View {
    @Binding var passwordInput: String
    @Binding var isUnlock: Bool
    var password: String = ""
    var isSetting = false
    let keyboard = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    var body: some View {
        VStack {
            HStack{
                ForEach(0..<passwordInput.count, id: \.self) { item in
                    PasswordCircleView()
                }
                ForEach(0..<password.count-passwordInput.count, id: \.self) { item in
                    PasswordCircleView(isFill: true)
                }
            }
            .padding()
            .padding(.bottom, 44)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 15) {
                ForEach(keyboard, id: \.self) { item in
                    PasswordNumberButton(userInsertPassword: $passwordInput, buttonText: item)
                }
                FaceIdButton(isUnlocked: $isUnlock)
                    .disabled(isSetting)
                    .foregroundStyle(isSetting ? Color.clear : Color.primarymain)
                PasswordNumberButton(userInsertPassword: $passwordInput, buttonText: "0")
                PasswordNumberButton(userInsertPassword: $passwordInput, isBackButton: true)
            }
            .padding(.horizontal)
            .padding(.horizontal)
            .padding(.horizontal)
        }
        .onChange(of: passwordInput) { oldValue, newValue in
            if(passwordInput.count == password.count) {
                passwordInput.removeAll()
            }
        }
    }
}

struct PasswordNumberButton: View {
    @Binding var userInsertPassword: String
    var buttonText: String = ""
    var isBackButton: Bool = false
    var isFaceIdButton: Bool = false
    let maxPasswordLength = 6
    
    var body: some View {
        Button {
            if !isBackButton && userInsertPassword.count < maxPasswordLength { userInsertPassword.append(buttonText) }
            if isBackButton && userInsertPassword.count != 0 { userInsertPassword.removeLast() }
        } label: {
            if !isBackButton {
                Text(buttonText)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding()
                    .padding()
                    .background {
                        Circle()
                            .foregroundStyle(.secondary)
                            .opacity(0.3)
                    }
            }
            else { Image(systemName: "delete.backward.fill").font(.title) }
        }
    }
}

struct FaceIdButton: View {
    @Binding var isUnlocked: Bool
    let biometricType = UIDevice.current.biometricType
    var body: some View {
        let bioSymbol = biometricType == .faceID ? "faceid" : "touchid"
        Button {
            authenticate(isUnlock: $isUnlocked, isPasswordView: .constant(true))
        } label: {
            
            Image(systemName: bioSymbol)
                .font(.title)
        }
    }
}

struct PasswordCircleView: View {
    var isFill: Bool = false
    let circleFrame: CGFloat = 14
    var body: some View {
        Group {
            if isFill {
                Circle()
                    .foregroundStyle(Color.gray.opacity(0.3))
            } else {
                Circle()
                    .foregroundStyle(Color.primarymain)
            }
        }
        .frame(width: circleFrame, height: circleFrame)
        .padding(.horizontal, 4)
    }
}
