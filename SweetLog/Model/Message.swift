//
//  Item.swift
//  MessageBox
//
//  Created by A_Mcflurry on 2023/08/05.
//

import Foundation
import SwiftData

@Model
final class Message {
    var date: Date
    var message: String
    
    init(date: Date, message: String) {
        self.date = date
        self.message = message
    }
}
