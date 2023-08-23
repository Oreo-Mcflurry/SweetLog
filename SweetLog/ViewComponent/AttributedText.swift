//
//  AttributedText.swift
//  MessageBox
//
//  Created by A_Mcflurry on 2023/08/21.
//

import SwiftUI

struct AttributedText: View {
    let text: String
    let keywords: [String]
    var body: some View {
        HStack(spacing: 0) {
            ForEach(keywords, id: \.self) { keyword in
                let components = text.components(separatedBy: keyword)
                ForEach(0..<components.count, id: \.self) { index in
                    if index < components.count - 1 {
                        Text(components[index])
                            .foregroundStyle(.black)
                        +
                        Text(keyword)
                            .foregroundColor(Color.red)
                    } else {
                        Text(components[index])
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    AttributedText(text: "Hello World!", keywords: ["o"])
}
