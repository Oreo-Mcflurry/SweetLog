//
//  ForeachSerchView.swift
//  SweetLog
//
//  Created by A_Mcflurry on 2023/08/23.
//

import SwiftUI
import SwiftData

struct ForeachSerchView: View {
    let fetchMessage: Message
    let serchText: [String]
    @State private var message = ""
    @State private var date = Date()
    @Environment (\.modelContext) var modelContext
    var body: some View {
        ZStack {
            AttributedText(text: message, keywords: serchText)
        }
        .onAppear {
            message = fetchMessage.message
        }
    }
}

#Preview {
    ForeachSerchView(fetchMessage: Message(date: Date(), message: "TestData"), serchText: ["T"])
}
