//
//  DetailViewModel.swift
//  SweetLog
//
//  Created by A_Mcflurry on 10/26/23.
//

import Foundation

class DetailViewModel: ObservableObject {
	@Published var showModal: Bool = false
	@Published var showDeleteAlert: Bool = false
}
