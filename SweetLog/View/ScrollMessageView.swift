//
//  ScrollMessageView.swift
//  SweetLog
//
//  Created by A_Mcflurry on 2023/09/01.
//

import SwiftUI
import SwiftData

struct ScrollMessageView: View {
    let message: Message
    var searchText: String? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                if let search = searchText { AttributedText(text: message.message, keyword: search) }
                else { Text(message.message) }
            }
            .foregroundStyle(.black)
            .multilineTextAlignment(.leading)
            .lineLimit(7)
            .padding()
            
            HStack {
                Spacer()
                Text(DateFormatter.customDateFormatter.string(from: message.date))
                    .font(.caption)
                    .padding(.trailing)
                    .padding(.bottom)
                    .foregroundStyle(Color.primarydark)
            }
        }
        .background(
            Color.list
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .opacity(0.7)
                .blur(radius: 0.5)
        )
    }
}

#Preview {
    MainView()
}

