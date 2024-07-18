//
//  SearchView.swift
//  DocOnlineTest
//
//  Created by Анастасия on 10.04.2024.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.docSilver)
                .padding(.leading, 8)
            TextField("Поиск", text: $searchText)
                .font(.callout)
            .frame(height: 36)
        }
        .background(RoundedRectangle(cornerRadius: 8)
            .fill(.docWhite)
            .stroke(.docGrey, lineWidth: 1))
    }
}

#Preview {
    SearchView(searchText: .constant(""))
}
