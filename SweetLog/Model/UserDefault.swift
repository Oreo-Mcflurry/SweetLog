//
//  UserDefault.swift
//  MessageBox
//
//  Created by A_Mcflurry on 2023/08/06.
//

import Foundation
import LocalAuthentication

class UserData: ObservableObject {
    @Published var isFirstRun: Bool
    @Published var useFaceID: Bool
    @Published var password: String
    @Published var name: String

    init() {
        let isFirstRunKey = "isFirstRun"
        let useFaceIDKey = "useFaceID"
        let nameKey = "name"
        let passwordKey = "password"

        self.isFirstRun = UserDefaults.standard.bool(forKey: isFirstRunKey)
        self.useFaceID = UserDefaults.standard.bool(forKey: useFaceIDKey)
        self.name = UserDefaults.standard.string(forKey: nameKey) ?? "Default"
        self.password = UserDefaults.standard.string(forKey: passwordKey) ?? ""

        if !isFirstRun {
            UserDefaults.standard.set(true, forKey: isFirstRunKey)
        }
    }
}
