//
//  ContentView.swift
//  MessageBox
//
//  Created by A_Mcflurry on 2023/08/05.
//

import SwiftUI
import SwiftData
import LocalAuthentication

struct ContentView: View {
    @StateObject var dataModel = SwiftDataViewModel()
    @EnvironmentObject var userData: UserData
    @Environment (\.modelContext) var modelContext
    @Query var messages: [Message]
    
    var body: some View {
            VStack {
                List {
                    ForEach(messages) { item in
                        Text("\(item.message)" + "")
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    dataModel.deleteItems(item: item)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                    }
                }
                
                Button("ADDTest") {
                    dataModel.addItem(date: Date(), message: "Musk")
                }
                
                Button("SerchTest") {
//                    isSerching.toggle()
                }
            }
            .onAppear {
                dataModel.modelContext = modelContext
            }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Message.self, inMemory: true)
}



