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
	@StateObject var viewModel = AddEditViewModel()
    @StateObject var dataModel = MessageDataManager()
    @Environment (\.modelContext) var modelContext
    
    var body: some View {
        
        VStack(alignment: .leading) {
            toolbarview
            dateview
            textedit
            savebutton
        }
        .padding(.top, 36)
        .padding(.horizontal, 20)
        .background {
            Image(image: .addBG)
                .resizable()
                .ignoresSafeArea()
                .frame(width: UIWidth, height: UIHeight)
        }
        .onAppear {
            if let message = editMessage {
				viewModel.text = message.message
				viewModel.date = message.date
            }
            dataModel.modelContext = modelContext
        }
    }
    
    var toolbarview: some View {
        HStack {
            Text(editMessage == nil ? "Add Message" : "Edit Message")
                .foregroundStyle(Color.secondarymain)
                .font(.CustomFont.regular.font(size: 20))
            
            Spacer()
            
            Button {
                self.showModal.toggle()
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(Color.secondarymain)
                    .font(.system(size: 18))
            }
        }
    }
    
    var dateview: some View {
        HStack {
			Text(DateFormatter.customDateFormatter.string(from: viewModel.date))
                .foregroundStyle(Color.labelbrown)
                .font(.system(size: 14))
            
            Image(systemName: "calendar")
                .foregroundStyle(Color.primarymain)
                .overlay{
					DatePicker("", selection: $viewModel.date, displayedComponents: [.date])
                    .blendMode(.destinationOver)
                    .padding(.top)
                }
            Spacer()
        }
        .padding(.vertical)
    }
    
    var textedit: some View {
        ZStack {
			if self.viewModel.text.isEmpty {
					 TextEditor(text: .constant("보관하고 싶은 메세지를 입력해주세요"))
                         .font(.system(size: 14))
                         .foregroundColor(.labelgreen)
                         .disabled(true)
                         .padding(.all, 8)
                         .background {
                             Color.white.clipShape(RoundedRectangle(cornerRadius: 8))
                         }
                 }
			TextEditor(text: $viewModel.text)
                    .font(.system(size: 14))
                    .foregroundStyle(Color.label1)
					.opacity(self.viewModel.text.isEmpty ? 0.25 : 1)
                    .padding(.all, 8)
                    .background {
                        Color.white
							.opacity(viewModel.text == "" ? 0 : 1)
                    }
                    
        }
    }
    
    var savebutton: some View {
        Button {
            if editMessage == nil {
				dataModel.addItem(date: viewModel.date, message: viewModel.text)
            } else {
				dataModel.updateItems(item: editMessage!, date: viewModel.date, message: viewModel.text)
            }
            self.showModal.toggle()
        } label: {
			Radial(text: "저장", isDisable: viewModel.text == "")
        }
        .padding(.vertical)
        .frame(height: 80)
		.disabled(viewModel.text == "")
    }
}

#Preview {
    NavigationStack {
        AddEditView(showModal: .constant(false))
    }
}
