//
//  SerchView.swift
//  MessageBox
//
//  Created by A_Mcflurry on 2023/08/21.
//

import SwiftUI
import SwiftData

struct SerchView: View {
    @Environment (\.modelContext) var modelContext
    @State var searchText: String = ""
    @State var isSearching: Bool = false
    @Query var messages: [Message]
    @Environment(\.dismiss) private var dismiss
    
    var serchingMessages: [Message] {
        let queryMessages = messages.compactMap { item in
            let containQuery = item.message.range(of: searchText, options: .caseInsensitive) != nil
            
            return containQuery ? item : nil
        }
        return queryMessages
    }
    
    var body: some View {
        ZStack {
            if searchText == "" {
                Text("검색어를 입력해주세요")
                    .font(.footnote)
                    .foregroundStyle(Color.labelbrown)
                    .padding(.bottom)
            } else {
                ScrollView {
                    ForEach(serchingMessages) { item in
                        NavigationLink {
                            DetailView(message: item, searchText: searchText)
                        } label: {
                            ScrollMessageView(message: item, searchText: searchText)
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .background {
            Image(image: .mainBG)
                .resizable()
                .ignoresSafeArea()
                .frame(width: UIWidth, height: UIHeight)
            
        }
                .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                serchbarView
            }
            
            ToolbarItem {
                Button("취소") { dismiss() }
                .foregroundStyle(Color.primarymain)
            }
        }
    }
    
    private var serchbarView: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color.textfieldSF)
                .font(.callout)
            TextField("검색", text: $searchText)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 10)
        .frame(width: UIWidth*0.8)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color.textfield)
        }
    }
}


#Preview {
    NavigationStack {
        MainView()
//            .modelContext(previewmod)
    }
}
