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
    
    var body: some View {
        ScrollView {
            SearchView(searchText: $searchText)
                .padding([.top], 15)
            
            FilterView(activeFilter: $activeFilter)
                .padding([.top], 16)
            
            LazyVStack(spacing: 16) {
//                ForEach($viewModel.filteredUsers(searchText: searchText, filter: activeFilter))
                ForEach(viewModel.users) { user in
                    DocCustomCell(user: user)
                }
            }
            .padding([.top], 20)
        }
        .padding(.horizontal, 16)
        .onAppear {
            viewModel.fetchPosts()
        }
    }
}

#Preview {
    MainView()
}
