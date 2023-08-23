//
//  SerchView.swift
//  MessageBox
//
//  Created by A_Mcflurry on 2023/08/21.
//

import SwiftUI
import SwiftData

struct SerchView: View {
    @State var serchText: String = ""
    @Environment (\.modelContext) var modelContext
    @State var serchingMessages: [Message] = []
    
    var body: some View {
        VStack {
            
            ForEach(serchingMessages) { item in
                
                NavigationLink {
//                    DetailView()
                } label: {
                    ForeachSerchView(fetchMessage: item, serchText: [serchText])
                }
                
            }
        }
        .onChange(of: serchText) { oldValue, newValue in
            let predicate = #Predicate<Message> { $0.message.contains(newValue) }
            let descriptor = FetchDescriptor<Message>(predicate: predicate)
            do {
                let currentTrain = try modelContext.fetch(descriptor)
                serchingMessages = currentTrain
                
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
        .toolbar {
//            ToolbarItem() {
                TextField("검색", text: $serchText)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 310)
//            }
            
        }
        
    }
}

#Preview {
    NavigationStack {
        SerchView()
    }
}
