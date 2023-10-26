//
//  SettingView.swift
//  SweetLog
//
//  Created by A_Mcflurry on 2023/09/12.
//

import SwiftUI

struct SettingView: View {
	@StateObject var viewModel = SettingViewModel()
    @EnvironmentObject var userData: UserData
    var body: some View {
        ZStack {
            Color.backGround.ignoresSafeArea()
            VStack {
				Toggle(isOn: $viewModel.useFaceID) {
                    Text("생체인증 잠금")
                }
                .padding()
                .padding()
                Spacer()
            }
        }
		.navigationDestination(isPresented: $viewModel.isSettingPassword) { PasswordSettingView(useFaceID: $viewModel.useFaceID) }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Setting")
                    .foregroundStyle(Color.primarymain)
                    .font(.CustomFont.light.font(size: 24))
            }
        }
		.onChange(of: viewModel.useFaceID) { oldValue, newValue in
            if newValue {
				viewModel.isSettingPassword = newValue
            } else {
                UserDefaults.standard.set(newValue, forKey: "useFaceID")
            }
            
        }
    }
}
