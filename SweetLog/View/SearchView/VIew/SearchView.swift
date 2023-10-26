//
//  SerchView.swift
//  MessageBox
//
//  Created by A_Mcflurry on 2023/08/21.
//

import SwiftUI
import SwiftData

struct SearchView: View {
	@Query(sort : \Message.date) var messages: [Message]
    @Environment (\.modelContext) var modelContext
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel = SearchViewModel()

    var searchingMessages: [Message] {
        let queryMessages = messages.compactMap { item in
			let containQuery = item.message.range(of: viewModel.searchText, options: .caseInsensitive) != nil

            return containQuery ? item : nil
        }
        return queryMessages
    }
    
    var body: some View {
        ZStack {
            Color.backGround.ignoresSafeArea()
			if viewModel.searchText == "" {
                notSearchView
            } else {
                searchScroll
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) { searchbarView }
            ToolbarItem { cancleButton }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbarBackground(Color.backGround)
    }
    
    
    
    private var searchbarView: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color.textfieldSF.opacity(0.6))
                .font(.system(size: 16))
			TextField("검색", text: $viewModel.searchText)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 10)
        .frame(width: UIWidth*0.8, height: 36)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color.textfield.opacity(0.12))
        }
    }
    
    private var notSearchView: some View {
        Text("검색어를 입력해주세요")
            .font(.system(size: 14))
            .foregroundStyle(Color.labelbrown)
            .padding(.bottom)
    }
    
    private var cancleButton: some View {
        Button("취소") { dismiss() }
            .foregroundStyle(Color.primarymain)
    }
    
    private var searchScroll: some View {
        ScrollView {
            ForEach(searchingMessages) { item in
                NavigationLink {
					DetailView(message: item, searchText: viewModel.searchText)
                } label: {
					ScrollMessageView(message: item, searchText: viewModel.searchText)
                }
                .padding(.horizontal)
            }
        }
        .padding(.top, 10)
    }
}
