//
//  FaceIDAuthView.swift
//  MessageBox
//
//  Created by A_Mcflurry on 2023/08/07.
//

import SwiftUI
import LocalAuthentication

struct FaceIDAuthView: View {
    @EnvironmentObject var userData: UserData
    @Environment (\.modelContext) var modelContext
    @Binding var isUnlocked: Bool
    var body: some View {
            VStack{
                Text("다시 인증해주세요")
                Button {
                    authenticate(isUnlock: $isUnlocked)
                } label: {
                    Radial(text: "")
                        .frame(width: 86, height: 50)
                        .padding(.horizontal)
                        .overlay {
                            Image(systemName: "faceid")
                                .foregroundStyle(.white)
                                .font(.title)
                        }
                }
            }
            .onAppear(perform: { authenticate(isUnlock: $isUnlocked) })
    }
}
//
//#Preview {
//    FaceIDAuthView()
//}

//
//if !isUnlocked {
//    VStack{
//        Text("인증해주세요.")
//        Button("다시 인증하기") {
//            authenticate(isUnlock: $isUnlocked)
//        }
//    }
//    .onAppear(perform: { authenticate(isUnlock: $isUnlocked) })
//
//} else {
//    Text("인증완")
//        .onDisappear {
//            isUnlocked = false
//        }
//
//    TipView(tipTest, arrowEdge: .bottom)
//
//}
//
//
//}
//.onAppear { dataModel.modelContext = modelContext }
//.task {
//// Configure and load your tips at app launch.
//try? await Tips.configure {
//    DisplayFrequency(.immediate)
//    DatastoreLocation(.applicationDefault)
//}
//
//}
