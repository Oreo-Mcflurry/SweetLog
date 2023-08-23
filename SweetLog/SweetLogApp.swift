//
//  SweetLogApp.swift
//  SweetLog
//
//  Created by A_Mcflurry on 2023/08/23.
//

import SwiftUI

@main
struct SweetLogApp: App {
    @StateObject var userData = UserData()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(userData)
        }
        .modelContainer(for: Message.self)
    }
}
