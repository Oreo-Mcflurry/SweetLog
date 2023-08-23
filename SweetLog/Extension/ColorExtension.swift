//
//  ColorExtension.swift
//  MessageBox
//
//  Created by A_Mcflurry on 2023/08/20.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}

extension ShapeStyle {
    static var mainColor: Color { return Color(hex: "#FF9F9B") }
    static var lightColor: Color { return Color(hex: "#FFF0EB") }
    static var listColor: Color { return Color(hex: "#FFF9F5") }
    static var buttonColor: Color { return Color(hex: "#BFD449") }
    static var backGroundColor: Color { return Color(hex: "FFFBF4") }
    static var secounaryDarkColor: Color { return Color(hex: "9BAF28") }
    
}

#Preview {
    VStack {
        Rectangle()
    }
}


