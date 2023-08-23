//
//  Logo.swift
//  MessageBox
//
//  Created by A_Mcflurry on 2023/08/20.
//

import SwiftUI

struct Logo: View {
    var body: some View {
        Text("Sweet Log")
            .foregroundStyle(Color.mainColor)
            .font(.CustomFont.regular.font(size: 32))
    }
}

#Preview {
    Logo()
}
