//
//  ShareViewController.swift
//  SweetLogShare
//
//  Created by A_Mcflurry on 2023/09/14.
//

import UIKit
import Social
import SwiftData

class ShareViewController: SLComposeServiceViewController {
    override func isContentValid() -> Bool {
        return self.contentText.isEmpty == false
    }
    
    var selectedDate: Date?
    
    lazy var container: ModelContainer = {
        let container = try! ModelContainer(for: Message.self)
        return container
    }()
    
    // This method should be called when the user selects a date from the UIDatePicker.
    func updateSelectedDate(_ date: Date) {
        selectedDate = date
    }


    override func didSelectPost() {
        let container = container
        let context: ModelContext = ModelContext(container)
        
        let newData = Message(date: Date(), message: contentText)
        context.insert(newData)
        print(newData.message)
        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }
    
    override func configurationItems() -> [Any]! {
        
        return []
    }
}
