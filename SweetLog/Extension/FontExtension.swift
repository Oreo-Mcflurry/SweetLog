//
//  FontExtension.swift
//  SweetLog
//
//  Created by A_Mcflurry on 2023/08/22.
//

import SwiftUI

extension Font {
    enum CustomFont: String {
        case regular = "SulphurPoint-Regular"
        
        func font(size: CGFloat) -> Font {
            return Font.custom(rawValue, size: size)
        }
    }
}

struct Font_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Font Name")
                .font(.CustomFont.regular.font(size: 18))
            
            Button("Font") {
                for family in UIFont.familyNames.sorted() {
                    let names = UIFont.fontNames(forFamilyName: family)
                    print("Font names: \(names)")
                }
            }
        }
        
    }
}
