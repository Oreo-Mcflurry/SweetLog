//
//  SweetLogApp.swift
//  SweetLog
//
//  Created by A_Mcflurry on 2023/08/23.
//

import SwiftUI
import SwiftData

@main
struct SweetLogApp: App {
    @StateObject var userData = UserData()
    @State private var isUnlock: Bool = false
    @State private var isActive = true
    @State private var isInActive = false
    @Environment(\.scenePhase) private var scenePhase
    
    

    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                if !isInActive {
                    if userData.useFaceID && isUnlock == false {
                        FaceIDAuthView(isUnlock: $isUnlock)
                    } else {
                        MainView()
                    }
                } else {
                    ZStack {
                        Color.backGround.ignoresSafeArea()
                        Image(image: .heart)
                    }
                        
                }
            }
            .environmentObject(userData)
            .onChange(of: scenePhase) { oldScenePhase, newScenePhase in
                if newScenePhase == .inactive { isInActive = true }
                else { isInActive = false }
                
                if newScenePhase == .active && !isActive {
                    isInActive = false
                    isUnlock = false
                    isActive = true
                }
                if newScenePhase == .background {
                    print("Count Back")
                    let queue = DispatchQueue.global(qos: .utility)
                        queue.asyncAfter(deadline: .now() + 180) {
                            print("Lock")
                            isActive = false
                    }
                    
                }
                
            }
            
        }
        .modelContainer(for: Message.self)
        
    }
}
