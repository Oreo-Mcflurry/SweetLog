//
//  ImageExtension.swift
//  MessageBox
//
//  Created by A_Mcflurry on 2023/08/20.
//

import SwiftUI

extension Image {
    enum ImageCase: String {
        case heart = "Heart"
        case addBG = "AddBG"
        case mainBG = "MainBG"
    }
}

extension Image {
    init(image: ImageCase) {
        self.init(image.rawValue)
    }
}

#Preview {
    Image(image: .heart)
}
