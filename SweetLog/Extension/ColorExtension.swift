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
    static var backGround: Color { return Color(hex: "FFFBF4") }
    static var label1: Color { return Color(hex: "2C2625") }
    static var label2: Color { return Color(hex: "413734") }
    static var labelbrown: Color { return Color(hex: "9A897D") }
    static var labelgreen: Color { return Color(hex: "BBBFA6") }
    static var primarymain: Color { return Color(hex: "FF7C77") }
    static var primarylight: Color { return Color(hex: "FF9F9B") }
    static var primarydark: Color { return Color(hex: "D1807D") }
    static var list: Color { return Color(hex: "FFF9F5").opacity(0.7) }
    static var secondarybutton: Color { return Color(hex: "BFD449") }
    static var radial: Color { return Color(hex: "FBFFE5").opacity(0.7) }
    static var textfieldSF: Color { return Color(hex: "3C3C43").opacity(0.6) }
    static var textfield: Color { return Color(hex: "767680").opacity(0.12) }
    static var secondarymain: Color { return Color(hex: "A5B936") }
    static var secondarydark: Color { return Color(hex: "9BAF28") }
}

#Preview {
    VStack {
        Rectangle().foregroundStyle(Color.backGround)
        Rectangle().foregroundStyle(Color.label1)
        Rectangle().foregroundStyle(Color.label2)
        Rectangle().foregroundStyle(Color.labelbrown)
        Rectangle().foregroundStyle(Color.labelgreen)
        Rectangle().foregroundStyle(Color.primarymain)
        Rectangle().foregroundStyle(Color.primarylight)
        Rectangle().foregroundStyle(Color.primarydark)
        Rectangle().foregroundStyle(Color.list)
        Rectangle().foregroundStyle(Color.secondarybutton)
        
    }
}


