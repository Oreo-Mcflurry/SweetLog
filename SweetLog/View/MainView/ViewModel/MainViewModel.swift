//
//  MainViewModel.swift
//  SweetLog
//
//  Created by A_Mcflurry on 10/26/23.
//

import Foundation

class MainViewModel: ObservableObject {
  @Published var showModal: Bool = false
  @Published var scrollOffset: CGFloat = 0.0
}
