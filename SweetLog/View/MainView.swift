//
//  MainView.swift
//  SweetLog
//
//  Created by A_Mcflurry on 2023/08/23.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @StateObject var dataModel = SwiftDataViewModel()
    @EnvironmentObject var userData: UserData
    @Environment (\.modelContext) var modelContext
    @Query var messages: [Message]
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backGroundColor.ignoresSafeArea()
                VStack {
                    Spacer()
                    Logo()
                    Image(image: .heart)
                    
                    Button {
                        dataModel.addItem(date: Date(), message: "Musk")
                    } label: {
                        Image("plusbutton")
                    }
                    
                    if messages.isEmpty {
                        Text("+ 버튼을 눌러 달콤한 메세지를 추가해보세요")
                            .foregroundColor(.secounaryDarkColor)
                            .padding()
                        Spacer()
                    } else {
                        Spacer()
                        
                        NavigationLink {
                        } label: {
                            VStack {
                                Text("\(messages.count) messages")
                                    .font(.CustomFont.regular.font(size: 15))
                                    .foregroundColor(.mainColor)
                                
                                
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.mainColor)
                                    .padding()
                            }
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            SerchView()
                        } label: {
                            Image(systemName: "magnifyingglass").foregroundColor(.mainColor)
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            ContentView()
                        } label: {
                            Image(systemName: "slider.horizontal.3").foregroundColor(.mainColor)
                            
                        }
                    }
                }
                .onAppear {
                    dataModel.modelContext = modelContext
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MainView()
    }
}
