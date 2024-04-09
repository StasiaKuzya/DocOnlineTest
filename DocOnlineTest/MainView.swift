//
//  ContentView.swift
//  DocOnlineTest
//
//  Created by Анастасия on 09.04.2024.
//


import SwiftUI

struct MainView: View {
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
                    HStack(alignment: .center) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.docSilver)
                            .padding(.leading, 8)
                        TextField("Поиск", text: $searchText)
                            .font(.system(size: 14))
                        .cornerRadius(8)
                        .frame(height: 36)
                        
                    }
                    .background(Color.white)
                    .border(.docGrey)
                    .cornerRadius(8)
                    .padding([.leading, .trailing], 16)
                    .padding([.top], 15)

                    // Кнопки фильтрации
                    HStack(
                        spacing: 0 ) {
                        ForEach(FilterType.allCases, id: \.self) { filterType in
                            Button(action: {
                                self.activeFilter = self.activeFilter == filterType ? nil : filterType
                            }) {
                                Text(filterType.rawValue)
                                    .font(.system(size: 14))
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .frame(height: 32)
                                    .foregroundColor(activeFilter == filterType ? .white : .docDarkGrey)
                                    .background(activeFilter == filterType ? .docPink : .docWhite)
                            }
                            .frame(height: 32)
                            .border(.docGrey)
                        }
                    }
                    .cornerRadius(8)
                    .padding([.leading, .trailing, .top], 16)
                    
                    LazyVStack(spacing: 16) {
                        ForEach(0..<4) { item in
                            NavigationLink(destination: DetailDocView()) {
                                DocCustomCell(
                                    docLastName: "Doe",
                                    docFirstName: "John",
                                    docMiddleName: "Johnovich",
                                    docRating: "5",
                                    specialization: "Physician",
                                    workExperience: "27",
                                    docPrice: "600",
                                    docPhoto: "mockPhoto"
                                )
                                .background(.docWhite)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding([.top], 20)
                    
                }
                .navigationTitle("Педиатры")
                .navigationBarTitleDisplayMode(.inline)
                .background(.docBackground)
                .navigationBarItems(leading: Button(action: {
                }) {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .font(.system(size: 16, weight: .bold))
                })
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Педиатры")
                            .font(.title3)
                    }
                }
                .background(Color("docBackground"))

            }
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

struct DetailDocView: View {
    var body: some View {
        Text("Детальная страница")
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Мое")
    }
}


