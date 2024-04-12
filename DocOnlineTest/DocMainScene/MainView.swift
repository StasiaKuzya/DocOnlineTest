//
//  ContentView.swift
//  DocOnlineTest
//
//  Created by Анастасия on 09.04.2024.
//


import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = DocViewModel()
    
    @State private var searchText = ""
    @State private var activeFilter: FilterType? = nil
    
    enum FilterType: String, CaseIterable {
        case price = "По цене"
        case experience = "По стажу"
        case rating = "По рейтингу"
    }
    
    var body: some View {
        TabView {
            NavigationView {
                ScrollView {
                    SearchView()
                    .padding([.top], 15)
                    
                    FilterView()
                    .padding([.top], 16)
                    
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.users) { user in
                            NavigationLink(destination:
                                            DocDetailView(user: user)) {
                                DocCustomCell(user: user)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding([.top], 20)
                }
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .background(.docBackground)
                .navigationBarItems(leading: Button(action: {
                }) {
                    ChevronView()
                })
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Педиатры")
                            .font(.title3)
                    }
                }
                .background(Color("docBackground"))

            }
            .onAppear {
                viewModel.fetchPosts()}
            .tabItem {
                Image("mainTab")
                Text("Главная")
            }
            Text("")
                .tabItem {
                    Image("appointTab")
                    Text("Приёмы")
                }
            Text("")
                .tabItem {
                    Image("chatTab")
                    Text("Чат")
                }
            Text("")
                .tabItem {
                    Image("profileTab")
                    Text("Профиль")
                }
        }
        .accentColor(.docDarkGrey)
    }
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .docWhite
        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

#Preview {
    MainView()
}
