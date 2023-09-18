//
//  Model.swift
//  SweetLogShare
//
//  Created by A_Mcflurry on 2023/09/14.
//

import Foundation

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
