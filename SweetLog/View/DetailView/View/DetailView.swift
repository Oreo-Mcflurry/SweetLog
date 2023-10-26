//
//  DetailView.swift
//  SweetLog
//
//  Created by A_Mcflurry on 2023/09/02.
//

import SwiftUI

struct DetailView: View {
    let message: Message
    var searchText: String? = nil
	@StateObject var viewModel = DetailViewModel()
    @StateObject var dataModel = MessageDataManager()
    @Environment (\.modelContext) var modelContext
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text(DateFormatter.customDateFormatter.string(from: message.date))
                        .font(.system(size: 15))
                        .foregroundStyle(Color.labelbrown)
                    Spacer()
                }
                .padding(.vertical)
                .padding(.bottom)
                
                Group {
                    if let search = searchText {
                        AttributedText(text: message.message, keyword: search, isDetail: true)
                    } else {
                        Text(message.message)
                            .foregroundStyle(Color.label1)
                    }
                }
                .multilineTextAlignment(.leading)
                
            }
            .padding(.horizontal)
            .padding(.horizontal, 4)
        }
        .toolbar { ToolbarItem(placement: .topBarTrailing) { toolbarmenu } }
        .toolbarBackground(Color.backGround)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { dataModel.modelContext = modelContext }
		.sheet(isPresented: self.$viewModel.showModal) { AddEditView(editMessage: message, showModal: $viewModel.showModal) }
        .background(Color.backGround)
		.alert("메세지를 삭제할까요?", isPresented: $viewModel.showDeleteAlert) {
            cancleButton
            deleteButton
        }
        
    }
    
    private var toolbarmenu: some View {
        Menu {
            Button {
				self.viewModel.showModal.toggle()
            } label: {
                HStack {
                    Text("수정하기")
                    Spacer()
                    Image(systemName: "square.and.pencil")
                }
            }

            Button(role: .destructive) {
				self.viewModel.showDeleteAlert.toggle()
            } label: {
                HStack {
                    Text("삭제하기")
                    Spacer()
                    Image(systemName: "trash")
                }
                
            }
        } label: {
            Image(systemName: "ellipsis.circle")
                .foregroundStyle(Color.primarymain)
        }
    }
    
    private var deleteButton: some View {
        Button("삭제", role: .destructive) {
            dataModel.deleteItems(item: message)
            dismiss()
        }
    }
    
    private var cancleButton: some View {
        Button("취소", role: .cancel) { }
    }
}
