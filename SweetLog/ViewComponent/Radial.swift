//
//  Radial.swift
//  SweetLog
//
//  Created by A_Mcflurry on 2023/09/01.
//

import SwiftUI

struct Radial: View {
    let text: String
    var isDisable: Bool = false
    var isPlus: Bool? = nil
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 1000)
                .fill(isDisable ? Color.disableBackGround : Color.secondarybutton)
                .fill (
                        LinearGradient(
                            gradient: Gradient(colors: [isDisable ? .clear : Color.radial.opacity(0.7), .clear]),
                            startPoint: .topLeading,
                            endPoint: .center)
                )
            Group {
                if isPlus != nil {
                    Image(systemName: "plus")
                } else {
                    Text(text)
                        
                }
            }
            .foregroundStyle(isDisable ? Color.disableText : .white)
            .font(.system(size: 14))
            .bold()
        }
    }
}

#Preview {
    Radial(text: "Test")
}
