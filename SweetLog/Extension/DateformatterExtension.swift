//
//  DateformatterExtension.swift
//  SweetLog
//
//  Created by A_Mcflurry on 2023/09/02.
//

import SwiftUI

extension DateFormatter {
    static var customDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        return formatter
    }
}
