//
//  AttributedText.swift
//  MessageBox
//
//  Created by A_Mcflurry on 2023/08/21.
//

//                    if isDetail {
//                        Text(keyword)
//                            .background(Color.primarylight)
//                    } else {
//                        Text(keyword)
//                            .foregroundColor(Color.red)
//                    }
//            let components = text.components(separatedBy: keyword)
//            ForEach(0..<components.count, id: \.self) { index in
//                if index < components.count - 1 {
//                    Text(components[index])
//                        .foregroundStyle(.black)
//
//                    if isDetail {
//                        Text(keyword)
//                            .background(Color.primarylight)
//                    } else {
//                        Text(keyword)
//                            .foregroundColor(Color.red)
//                    }
//
//                } else {
//                    Text(components[index])
//                        .foregroundStyle(.black)
//                }
//            }

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
            attributedString[range].backgroundColor = isDetail ? Color.primarymain : nil
        }
        
        return attributedString
    }
}

#Preview {
    AttributedText(text: "Hello Worldooooooooo!\n\n\n\n\n\n\n", keyword: "o", isDetail: true)
}
