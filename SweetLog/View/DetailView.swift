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
    @State var showModal: Bool = false
    @State var showDeleteAlert: Bool = false
    @StateObject var dataModel = SwiftDataViewModel()
    @Environment (\.modelContext) var modelContext
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                if let search = searchText {
                    AttributedText(text: message.message, keyword: search, isDetail: true)
                } else {
                    Text(message.message)
                        .foregroundStyle(Color.label1)
                }
            }
            .foregroundStyle(.black)
            .padding(.leading)
            
            HStack {
                Spacer()
                Text(DateFormatter.customDateFormatter.string(from: message.date))
                    .font(.caption)
                    .foregroundStyle(Color.labelbrown)
                    .padding()
            }
        }
        .onAppear {
            dataModel.modelContext = modelContext
        }
        .sheet(isPresented: self.$showModal) {
            AddEditView(editMessage: message, showModal: $showModal)
        }
        .alert("메세지를 삭제할까요?", isPresented: $showDeleteAlert) {
            cancleButton
            deleteButton
        }
        
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                toolbarmenu
            }
        }
    }
    
    private var toolbarmenu: some View {
        Menu {
            Button {
                self.showModal.toggle()
            } label: {
                HStack {
                    Text("수정하기")
                    Spacer()
                    Image(systemName: "square.and.pencil")
                }
            }
//
            Button(role: .destructive) {
                self.showDeleteAlert.toggle()
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

#Preview {
    NavigationStack {
        MainView()
    }
}
