//
//  SettingView.swift
//  SweetLog
//
//  Created by A_Mcflurry on 2023/09/12.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var userData: UserData
    @State private var useFaceID = UserDefaults.standard.bool(forKey: "useFaceID")
//    @State private var useFaceID = false
    var body: some View {
        ZStack {
            Color.backGround.ignoresSafeArea()
            VStack {
                HStack {
                    Toggle(isOn: $useFaceID) {
                        Text("생체인증 잠금")
                    }
                }
                .padding(.horizontal)
                Spacer()
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Setting")
                    .foregroundStyle(Color.primarymain)
                    .font(.CustomFont.regular.font(size: 24))
            }
        }
        .onChange(of: useFaceID) { oldValue, newValue in
            // When the toggle value changes, update UserDefaults
            UserDefaults.standard.set(newValue, forKey: "useFaceID")
        }
    }
}

#Preview {
    NavigationStack {
        SettingView()
    }
}
