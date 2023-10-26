//
//  SettingViewModel.swift
//  SweetLog
//
//  Created by A_Mcflurry on 10/26/23.
//

import Foundation

class SettingViewModel: ObservableObject {
	@Published var useFaceID = UserDefaults.standard.bool(forKey: "useFaceID")
	@Published var isSettingPassword: Bool = false
}
