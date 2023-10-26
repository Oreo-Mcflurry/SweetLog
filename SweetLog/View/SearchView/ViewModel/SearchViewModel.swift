//
//  SearchViewModel.swift
//  SweetLog
//
//  Created by A_Mcflurry on 10/26/23.
//

import Foundation

class SearchViewModel: ObservableObject {
	@Published var searchText: String = ""
	@Published var isSearching: Bool = false
}
