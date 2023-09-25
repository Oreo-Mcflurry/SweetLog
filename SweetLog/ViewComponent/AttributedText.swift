//
//  AttributedText.swift
//  MessageBox
//
//  Created by A_Mcflurry on 2023/08/21.
//

import SwiftUI
import UIKit

struct AttributedText: View {
    let text: String
    let keyword: String
    var isDetail: Bool = false
    
    var body: some View {
        Text(attributedString)
    }
    
    private var attributedString: AttributedString {
        let string = "\(text)"
        var attributedString = AttributedString(string)
        
        if let range = attributedString.range(of: "\(keyword)") {
            attributedString[range].foregroundColor = isDetail ? nil : .red
            attributedString[range].backgroundColor = isDetail ? Color.primarymain.opacity(0.3) : nil
        }
        
        return attributedString
    }
}

#Preview {
    AttributedText(text: "Hello Worldooooooooo!\n\n\n\n\n\n\n", keyword: "o", isDetail: true)
}
