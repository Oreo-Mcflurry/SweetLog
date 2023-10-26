//
//  AddEditViewModel.swift
//  SweetLog
//
//  Created by A_Mcflurry on 10/26/23.
//

import Foundation

class AddEditViewModel: ObservableObject {
	@Published var text: String = ""
	@Published var date: Date = Date()
}
