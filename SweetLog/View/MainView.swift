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
    @EnvironmentObject var userData: UserData
    @Environment(\.dismiss) private var dismiss
    @Query var messages: [Message]
    @State private var showModal: Bool = false
    @State private var isUnlock: Bool = false
    
    
    var body: some View {
        if userData.useFaceID && isUnlock == false {
            FaceIDAuthView(isUnlock: $isUnlock)
        } else {
            mainScreen
        }
        
    }
    
    var mainScreen: some View {
        GeometryReader { geo in
            ScrollViewReader { proxy in
                 ScrollView(showsIndicators: false) {
                    VStack {
                        firstScreen
                            .frame(height: UIHeight)
                            .id("first")
                        
                        messageScroll
                            .frame(height: UIHeight - geo.safeAreaInsets.magnitude)
                            .id("messages")
                        
                    }
                 }
                 .onAppear {
                     if messages.isEmpty { proxy.scrollTo("first") }
                    dataModel.modelContext = modelContext
                }
            }
            .scrollDisabled(messages.isEmpty)
            .scrollTargetBehavior(.paging)
            .background(Color.backGround)
            .ignoresSafeArea()
            .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                        Logo().padding()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    maintoolbar
                }
            }
        }
    }
    
    var firstScreen: some View {
        VStack {
            Spacer()
            Logo()
            Image(image: .heart)
            
            Button {
                self.showModal.toggle()
            } label: {
                Radial(text: "+")
                    .frame(width: 86, height: 50)
            }
            .sheet(isPresented: self.$showModal) {
                AddEditView(showModal: $showModal)
            }
            
            if messages.isEmpty {
                Text("+ 버튼을 눌러 달콤한 메세지를 추가해보세요")
                    .foregroundColor(Color.secondarydark)
                    .padding()
                Spacer()
            } else {
                Spacer()
                VStack {
                    Text("\(messages.count) messages")
                        .font(.CustomFont.regular.font(size: 15))
                        .foregroundColor(.primarymain)
                    Image(systemName: "chevron.down")
                        .foregroundColor(.primarymain)
                        .padding()
                        .padding(.bottom)
                }
            }
        }
        .padding(.top)
        .padding(.top)
    }
    
    var messageScroll: some View {
        ScrollView {
            LazyVStack {
                ForEach(messages) { item in
                    NavigationLink {
                        DetailView(message: item)
                    } label: {
                        ScrollMessageView(message: item)
                            .padding(.bottom)
                            .padding(.horizontal)
                        
                    }
                }
            }
            .ignoresSafeArea()
            
            
        }
        .background {
            Image(image: .mainBG)
                .resizable()
                .frame(width: UIWidth, height: .infinity)
                .ignoresSafeArea()
        }
    }
    
    var maintoolbar: some View {
        HStack {
            NavigationLink {
                SerchView()
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

#Preview {
    NavigationStack {
        MainView()
        //            .modelContext(ModelContext(p))
    }
}
