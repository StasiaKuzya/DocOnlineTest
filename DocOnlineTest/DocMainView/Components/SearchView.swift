//
//  SearchView.swift
//  DocOnlineTest
//
//  Created by Анастасия on 10.04.2024.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.docSilver)
                .padding(.leading, 8)
            TextField("Поиск", text: $searchText)
                .font(.system(size: 14))
            .cornerRadius(8)
            .frame(height: 36)
        }
        .background(.docWhite)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.docGrey, lineWidth: 1)
        )
        .cornerRadius(8)
        .padding([.leading, .trailing], 16)
    }
}

#Preview {
    SearchView()
}
