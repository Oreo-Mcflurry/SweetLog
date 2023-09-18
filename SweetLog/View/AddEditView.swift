//
//  AddEditView.swift
//  SweetLog
//
//  Created by A_Mcflurry on 2023/08/24.
//

import SwiftUI

struct AddEditView: View {
    var editMessage: Message? = nil
    @Binding var showModal: Bool
    
    @State var text: String = ""
    @State var date: Date = Date()
    @StateObject var dataModel = SwiftDataViewModel()
    @Environment (\.modelContext) var modelContext
    @State var placeholderText = "보관하고 싶은 달콤한 메세지를 입력해주세요"
    
    var body: some View {
        
        VStack(alignment: .leading) {
            toolbarview
            dateview
            textedit
            savebutton
        }
        .padding([.top, .horizontal])
        .padding(.top)
        .padding(.horizontal)
        .background {
            Image(image: .addBG)
                .resizable()
                .ignoresSafeArea()
                .frame(width: UIWidth, height: UIHeight)
        }
        .onAppear {
            if let message = editMessage {
                text = message.message
                date = message.date
            }
            dataModel.modelContext = modelContext
        }
    }
    
    var toolbarview: some View {
        HStack {
            Text(editMessage == nil ? "Add Message" : "Edit Message")
                .foregroundStyle(Color.secondarymain)
                .font(.CustomFont.regular.font(size: 24))
            
            Spacer()
            
            Button {
                self.showModal.toggle()
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(Color.secondarymain)
                    .font(.title3)
            }
        }
    }
    
    var dateview: some View {
        HStack {
            Text(DateFormatter.customDateFormatter.string(from: date))
                .foregroundStyle(Color.labelbrown)
            
            Image(systemName: "calendar")
                .foregroundStyle(Color.primarymain)
                .overlay{
                    DatePicker("", selection: $date, displayedComponents: [.date])
                    .blendMode(.destinationOver)
                    .padding(.top)
                }
            Spacer()
        }
        .padding(.vertical)
    }
    
    var textedit: some View {
        ZStack {
                 if self.text.isEmpty {
                   TextEditor(text: $placeholderText)
                     .font(.body)
                     .foregroundColor(.labelgreen)
                     .disabled(true)
                 }
                 TextEditor(text: $text)
                   .font(.body)
                   .foregroundStyle(Color.label1)
                   .opacity(self.text.isEmpty ? 0.25 : 1)
               }
    }
    
    var savebutton: some View {
        Button {
            if editMessage == nil {
                dataModel.addItem(date: date, message: text)
            } else {
                dataModel.updateItems(item: editMessage!, date: date, message: text)
            }
            self.showModal.toggle()
        } label: {
            Radial(text: "저장")
        }
        .padding(.vertical)
        .frame(height: 80)
        .disabled(text == "")
    }
}

#Preview {
    NavigationStack {
        AddEditView(showModal: .constant(false))
    }
}
