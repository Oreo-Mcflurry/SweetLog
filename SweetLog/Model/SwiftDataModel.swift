//
//  SwiftDataModel.swift
//  MessageBox
//
//  Created by A_Mcflurry on 2023/08/06.
//

import SwiftUI
import SwiftData

class SwiftDataViewModel: ObservableObject {
    var modelContext: ModelContext? = nil
    
    func addItem(date: Date, message: String) {
        let newMessage = Message(date: date, message: message)
        modelContext?.insert(newMessage)
        self.save()
    }
    
    func deleteItems(item: Message) {
        modelContext?.delete(item)
        self.save()
    }
    
    func updateItems(item: Message, date: Date, message: String) {
        item.date = date
        item.message = message
        self.save()
    }
    
    func save() {
        do {
            try modelContext?.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
