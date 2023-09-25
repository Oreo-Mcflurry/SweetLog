//
//  MainView.swift
//  SweetLog
//
//  Created by A_Mcflurry on 2023/08/23.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @StateObject var dataModel = SwiftDataViewModel()
    @Environment (\.modelContext) var modelContext
    
    @Environment(\.dismiss) private var dismiss
    @Query(sort : \Message.date) var messages: [Message]
    @State private var showModal: Bool = false
    @State private var scrollOffset: CGFloat = 0.0
    var body: some View {
        GeometryReader { geo in
            ScrollViewReader { proxy in
                ScrollViewOffset(onOffsetChange: { (offset) in
                    scrollOffset = offset }) {
                    VStack {
                        firstScreen
                            .frame(height: UIHeight)
                            .id("first")
                        
                        messageScroll
                            .frame(height: UIHeight - geo.safeAreaInsets.magnitude)
                            .id("messages")
                        
                    }
                    
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Logo()
                                .padding()
                                .opacity(0.003 * -scrollOffset)
                        }
                        ToolbarItem(placement: .topBarTrailing) { maintoolbar }
                    }
                    
                 }
                 .onAppear {
                     if messages.isEmpty { proxy.scrollTo("first") }
                    dataModel.modelContext = modelContext
                }
            }
            .scrollIndicators(.hidden)
            .scrollDisabled(messages.isEmpty)
            .scrollTargetBehavior(.paging)
            .ignoresSafeArea()
            .navigationTitle("")
            .toolbarBackground(Color.backGround)
            .background(Color.backGround)
        }
    }
    
    private var firstScreen: some View {
        VStack {
            Spacer()
            Logo()
            Image(image: .heart)
            
            Button {
                self.showModal.toggle()
            } label: {
                Radial(text: "", isPlus: true)
                    .frame(width: 86, height: 50)
            }
            .sheet(isPresented: self.$showModal) { AddEditView(showModal: $showModal) }
            
            if messages.isEmpty {
                Text("+ 버튼을 눌러 메세지를 추가해보세요")
                    .foregroundColor(Color.secondarydark)
                    .padding()
                Spacer()
            } else {
                Spacer()
                VStack {
                    Text("\(messages.count) messages")
//                    Text("525 messages")
                        .font(.CustomFont.regular.font(size: 15))
                        .foregroundColor(.primarymain)
                        .bold()
                    Image(systemName: "chevron.down")
                        .foregroundColor(.primarylight)
                        .padding()
                        .padding(.bottom)
                        .padding(.bottom)
                }
            }
        }
        
        .padding(.top)
        .padding(.top)
    }
    
    private var messageScroll: some View {
        ScrollView {
            LazyVStack {
                ForEach(messages) { item in
                    NavigationLink {
                        DetailView(message: item)
                    } label: {
                        ScrollMessageView(message: item)
                            .padding(.bottom, 5)
                            .padding(.horizontal)
                        
                    }
                }
            }
            .padding(.top, 10)
            .ignoresSafeArea()
            
            
        }
    }
    
    private var maintoolbar: some View {
        HStack {
            NavigationLink {
                SearchView()
            } label: {
                Image(systemName: "magnifyingglass").foregroundColor(.primarymain)
                    
            }
            
            NavigationLink {
                SettingView()
            } label: {
                Image(systemName: "slider.horizontal.3").foregroundColor(.primarymain)
                    
            }
        }
    }
}

//#Preview {
//    NavigationStack {
//        MainView()
        //            .modelContext(ModelContext(p))
//    }
//}
