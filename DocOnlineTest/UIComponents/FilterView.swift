//
//  HeadSceneView.swift
//  DocOnlineTest
//
//  Created by Анастасия on 10.04.2024.
//

import SwiftUI

struct FilterView: View {
    @Binding var activeFilter: FilterType?
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(FilterType.allCases, id: \.self) { filterType in
                Button(action: {
                    self.activeFilter = self.activeFilter == filterType ? nil : filterType
                }) {
                    Text(filterType.rawValue)
                        .font(.callout)
                        .frame(maxWidth: .infinity)
                        .frame(height: 32)
                        .foregroundColor(activeFilter == filterType ? .white : .docDarkGrey)
                        .background(activeFilter == filterType ? .docPink : .docWhite)
                }
                .frame(height: 32)
                .border(.docGrey)
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.docGrey, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    FilterView(activeFilter: .constant(.price))
}
