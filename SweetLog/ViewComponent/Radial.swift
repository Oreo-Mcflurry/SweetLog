//
//  Radial.swift
//  SweetLog
//
//  Created by A_Mcflurry on 2023/09/01.
//

import SwiftUI

struct Radial: View {
    let text: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 1000)
                .fill(Color.secondarybutton)
                .fill (
                    LinearGradient(
                        gradient: Gradient(colors: [Color.radial, Color.clear]),
                        startPoint: .topLeading,
                        endPoint: .center)
                )
            Text(text)
                .foregroundStyle(.white)
                .bold()
        }
    }
}

#Preview {
    Radial(text: "Test")
}
