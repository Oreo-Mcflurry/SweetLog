//
//  SettingView.swift
//  SweetLog
//
//  Created by A_Mcflurry on 2023/09/12.
//

import SwiftUI

struct SettingView: View {
//    @Binding var isInActive: Bool
    @State var useFaceID = UserDefaults.standard.bool(forKey: "useFaceID")
    @State var isSettingPassword: Bool = false
    @EnvironmentObject var userData: UserData
//    @Environment(\.scenePhase) private var scenePhase
    var body: some View {
        ZStack {
            Color.backGround.ignoresSafeArea()
            VStack {
                Toggle(isOn: $useFaceID) {
                    Text("생체인증 잠금")
                }
                .padding()
                .padding()
                Spacer()
            }
        }
        .navigationDestination(isPresented: $isSettingPassword) { PasswordSettingView(useFaceID: $useFaceID) }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Setting")
                    .foregroundStyle(Color.primarymain)
                    .font(.CustomFont.light.font(size: 24))
            }
        }
        .onChange(of: useFaceID) { oldValue, newValue in
            if newValue {
                isSettingPassword = newValue
            } else {
                UserDefaults.standard.set(newValue, forKey: "useFaceID")
            }
            
        }
    }
}

//#Preview {
//    NavigationStack {
//        SettingView()
//    }
//}
